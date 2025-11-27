# ==================================================================
# MODULE AWS EKS - KARPENTER
# ==================================================================

module "karpenter" {
  source  = "terraform-aws-modules/eks/aws//modules/karpenter"
  version = "~> 19.21"

  cluster_name                               = module.eks.cluster_name
  irsa_oidc_provider_arn                     = module.eks.oidc_provider_arn
  enable_karpenter_instance_profile_creation = true
  iam_role_additional_policies = {
    AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }
}

# ==================================================================
# HELM RELEASE - KARPENTER
# ==================================================================

resource "helm_release" "karpenter" {
  namespace           = "karpenter"
  create_namespace    = true
  name                = "karpenter"
  repository          = "oci://public.ecr.aws/karpenter"
  repository_username = data.aws_ecrpublic_authorization_token.token.user_name
  repository_password = data.aws_ecrpublic_authorization_token.token.password
  chart               = "karpenter"
  version             = "0.36.1"
  values = [
    <<-EOT
    settings:
      clusterName: ${local.aws_eks.cluster_name}
      clusterEndpoint: ${module.eks.cluster_endpoint}
      interruptionQueueName: ${module.karpenter.queue_name}
    serviceAccount:
      annotations:
        eks.amazonaws.com/role-arn: ${module.karpenter.irsa_arn}
    EOT
  ]
}

# ==================================================================
# KUBECTL MANIFEST - KARPENTER NODE CLASS
# ==================================================================

resource "kubectl_manifest" "karpenter_node_class" {
  yaml_body  = <<-YAML
    apiVersion: karpenter.k8s.aws/v1beta1
    kind: EC2NodeClass
    metadata:
      name: default
    spec:
      amiFamily: AL2
      role: ${module.karpenter.role_name}
      detailedMonitoring: true
      blockDeviceMappings:
      - deviceName: /dev/xvda
        ebs:
          volumeType: gp3
          volumeSize: 100Gi
          encrypted: true
          deleteOnTermination: true
      subnetSelectorTerms:
      - tags:
          karpenter.sh/discovery: ${local.aws_eks.cluster_name}
      securityGroupSelectorTerms:
      - tags:
          karpenter.sh/discovery: ${local.aws_eks.cluster_name}
      tags:
        karpenter.sh/discovery: ${local.aws_eks.cluster_name}
        Name: karpenter-instance
  YAML
  depends_on = [kubectl_manifest.karpenter_node_pool]
}

# ==================================================================
# KUBECTL MANIFEST - KARPENTER NODE POOL
# ==================================================================

resource "kubectl_manifest" "karpenter_node_pool" {
  yaml_body  = <<-YAML
    apiVersion: karpenter.sh/v1beta1
    kind: NodePool
    metadata:
      name: default
    spec:
      template:
        spec:
          nodeClassRef:
            apiVersion: karpenter.k8s.aws/v1beta1
            kind: EC2NodeClass
            name: default
          requirements:
          - key: "karpenter.k8s.aws/instance-category"
            operator: In
            values: ["c", "t"]
          - key: "karpenter.k8s.aws/instance-cpu"
            operator: In
            values: ["4", "8"]
          - key: "topology.kubernetes.io/zone"
            operator: In
            values: ${jsonencode(local.aws_azs)}
          - key: "kubernetes.io/arch"
            operator: In
            values: ["amd64"]
          - key: "karpenter.sh/capacity-type"
            operator: In
            values: ["spot"]
      limits:
        cpu: 1000
        memory: 1000Gi
      disruption:
        consolidationPolicy: WhenUnderutilized
        expireAfter: 2592000s # 30 Days = 60 * 60 * 24 * 30 Seconds;
  YAML
  depends_on = [helm_release.karpenter]
}
