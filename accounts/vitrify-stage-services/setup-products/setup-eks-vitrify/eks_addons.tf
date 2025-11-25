# ==================================================================
# MODULE AWS EKS ADDONS
# ==================================================================

module "eks_addons" {
  source  = "aws-ia/eks-blueprints-addons/aws"
  version = "~> 1.21"

  cluster_name      = module.eks.cluster_name
  cluster_endpoint  = module.eks.cluster_endpoint
  cluster_version   = module.eks.cluster_version
  oidc_provider_arn = module.eks.oidc_provider_arn

  eks_addons = {
    # ==================================================================
    # CORE NETWORKING
    # ==================================================================
    coredns = {
      addon_version        = local.aws_eks.cluster_addon_versions.coredns
      configuration_values = jsonencode(yamldecode(file("${path.root}/files/values/coredns.yaml")))
    }
    kube-proxy = {
      addon_version        = local.aws_eks.cluster_addon_versions.kube_proxy
      configuration_values = jsonencode(yamldecode(file("${path.root}/files/values/kube-proxy.yaml")))
    }
    # ==================================================================
    # CORE SECURITY
    # ==================================================================
    eks-pod-identity-agent = {
      addon_version        = local.aws_eks.cluster_addon_versions.eks_pod_identity_agent
      configuration_values = jsonencode(yamldecode(file("${path.root}/files/values/eks-pod-identity-agent.yaml")))
    }
    # ==================================================================
    # CORE STORAGE
    # ==================================================================
    aws-ebs-csi-driver = {
      addon_version            = local.aws_eks.cluster_addon_versions.aws_ebs_csi_driver
      service_account_role_arn = module.ebs_csi_driver_irsa.iam_role_arn
      configuration_values     = jsonencode(yamldecode(file("${path.root}/files/values/aws-ebs-csi-driver.yaml")))
    }
  }

  enable_aws_for_fluentbit = true
  aws_for_fluentbit = {
    enable_containerinsights = true
  }

  enable_aws_load_balancer_controller = true
  aws_load_balancer_controller = {
    name          = "aws-load-balancer-controller"
    namespace     = "kube-system"
    chart         = "aws-load-balancer-controller"
    chart_version = "1.7.1"
    repository    = "https://aws.github.io/eks-charts"
    lint          = true
    values = [
      templatefile("${path.root}/files/values/aws-load-balancer-controller.yaml.tftpl", {
        region = local.aws_region
        vpc_id = local.aws_eks.vpc_id
      })
    ]
  }

  enable_ingress_nginx = true
  ingress_nginx = {
    name          = "ingress-nginx"
    chart_version = "4.9.1"
    repository    = "https://kubernetes.github.io/ingress-nginx"
    namespace     = "ingress-nginx"
    lint          = true
    values        = [templatefile("${path.root}/files/values/ingress-nginx.yaml", {})]
    wait          = true
  }
}
