locals {
  # ==================================================================
  # GENERAL
  # ==================================================================
  client_name = "teckSolucoes"

  # ==================================================================
  # AWS GENERAL
  # ==================================================================
  aws_account_id = data.aws_caller_identity.current.account_id
  aws_azs        = slice(data.aws_availability_zones.available.names, 0, local.aws_num_azs)

  aws_dns_default = "teckSolucoes.tech"
  aws_environment = "prod"
  aws_num_azs     = 3
  aws_region      = "us-east-1"
  aws_client_acm  = data.aws_acm_certificate.client.arn
  aws_sso_role    = one(data.aws_iam_roles.sso_admin.names)

  # ==================================================================
  # AWS EKS
  # ==================================================================
  aws_eks = {
    cluster_name    = "eks-${local.aws_environment}-services"
    cluster_version = "1.33"
    cluster_addon_versions = {
      # ==================================================================  
      # CORE NETWORKING
      # ==================================================================
      coredns    = "v1.12.1-eksbuild.2"
      kube_proxy = "v1.33.0-eksbuild.2"
      # ==================================================================
      # CORE SECURITY
      # ==================================================================
      eks_pod_identity_agent = "v1.3.7-eksbuild.2"
      # ==================================================================
      # CORE STORAGE
      # ==================================================================
      aws_ebs_csi_driver = "v1.44.0-eksbuild.1"
    }
    subnet_ids         = data.aws_subnets.publish.ids
    subnet_public_ids  = join(", ", data.aws_subnets.public.ids)
    subnet_publish_ids = join(", ", data.aws_subnets.publish.ids)
    vpc_id             = data.aws_vpc.selected.id
  }

  # ==================================================================
  # GITLAB RUNNER CACHE
  # ==================================================================
  # gitlab_runner_cache = {
  #   bucket_name = "gitlab-runner-cache-slave-${local.client_name}-${local.aws_environment}"
  # }

  # ==================================================================
  # LABELS
  # ==================================================================
  aws_default_tags = {
    cost_allocation_business_unit  = "teckSolucoes"
    cost_allocation_product        = "teckSolucoes"
    operation_support_account_name = "${local.client_name}-${local.aws_environment}-services"
    operation_support_criticality  = "critical"
    operation_support_environment  = local.aws_environment
    operation_support_team         = "kubernetes"
    source_code                    = "https://gitlab.com/nuageit/delivery/teckSolucoes/cloud-management"
  }
}
