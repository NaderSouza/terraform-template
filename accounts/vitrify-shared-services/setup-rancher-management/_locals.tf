locals {
  # ==================================================================
  # GENERAL
  # ==================================================================
  client_name = "vitrify"
  # ==================================================================
  # AWS GENERAL
  # ==================================================================
  aws_account_id = data.aws_caller_identity.current.account_id
  aws_default_tags = {
    cost_allocation_business_unit  = "vitrify"
    cost_allocation_product        = "vitrify"
    operation_support_account_name = "${local.client_name}-${local.aws_environment}-services"
    operation_support_criticality  = "medium"
    operation_support_environment  = local.aws_environment
    operation_support_team         = "cloud"
    source_code                    = "https://gitlab.com/nuageit/delivery/vitrify/cloud-management"
    source_project                 = "setup-rancher-management"
  }
  aws_dns_default = "vitrify.tech"
  aws_environment = "dataos"
  aws_region      = "us-east-1"
  # ==================================================================
  # AWS EKS
  # ==================================================================
  aws_eks = {
    cluster_name        = "eks-${local.aws_environment}-services"
    cluster_description = "Imported AWS EKS ${local.client_name} ${local.aws_environment} services - By Terraform"
  }
  # ==================================================================
  # RANCHER
  # ==================================================================
  cattle_list = compact(split("---", trimspace(data.http.yaml_rancher_add_cluster.response_body)))
  rancher_instance = {
    admin_password = jsondecode(data.aws_secretsmanager_secret_version.rancher.secret_string)["RANCHER_ADMIN_PASSWORD"]
    server_url     = "https://rancher.${local.aws_dns_default}"
  }
}
