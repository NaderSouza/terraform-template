# ==================================================================
# GLOBAL LOCALS
# ==================================================================

locals {
  # ==================================================================
  # AWS DEFAULT
  # ==================================================================
  aws_account_id  = "582577266226"
  aws_environment = "prod"
  aws_region      = "sa-east-1"
  oidc_id         = "1B02EC4857AEF0C83B681DEBE104D63A" //Ajustar
  # ==================================================================
  # AWS EKS
  # ==================================================================
  aws_eks = {
    cluster_name      = "eks-${local.aws_environment}-services"
    cluster_version   = "1.32"
    oidc_provider_arn = "arn:aws:iam::${local.aws_account_id}:oidc-provider/oidc.eks.${local.aws_region}.amazonaws.com/id/${local.oidc_id}"
  }
  # ==================================================================
  # SECRET STORE CSI DRIVER - NAMESPACES E SERVICE ACCOUNTS
  # ==================================================================
  # secret_csi_namespace_us_map = {
  #   "mkzint-e-portfolio" = [
  #     "secret-csi-e-portfolio-api-e-portfolio",
  #     "secret-csi-e-portfolio-front-web"
  #   ]
  #   "mkzint-eduhub" = [
  #     "secret-csi-eduhub-api-eduhub",
  #     "secret-csi-eduhub-front-web"
  #   ]
  # }

  # secret_csi_namespace_serviceaccounts = flatten([
  #   for ns, sas in local.secret_csi_namespace_us_map : [
  #     for sa in sas : "${ns}:${sa}"
  #   ]
  # ])

  # ==================================================================
  # LABELS
  # ==================================================================
  labels = {
    cost_allocation_application     = "setup-github-runner-irsa"
    cost_allocation_business_unit   = "vitrify"
    cost_allocation_project         = "cloud-integrations"
    metadata_cloud_layer            = "integrations"
    metadata_git_url                = "https://github.com/nuageit/delivery/vitrify/cloud-management"
    metadata_terraform_project      = "accounts/integrations/setup-github-runner-irsa"
    operational_support_criticality = "high"
    operational_support_environment = local.aws_environment
    operational_support_team        = "cloud"
  }
}
