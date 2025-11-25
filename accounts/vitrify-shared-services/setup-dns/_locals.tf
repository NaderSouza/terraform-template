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
    source_project                 = "setup-dns"
  }
  aws_dns_default = "shared.vitrify.tech"
  aws_environment = "shared"
  aws_region      = "us-east-1"

  # ==================================================================
  # AWS NETWORK
  # ==================================================================
  aws_network = {
    vpc_name = "vpc-${local.aws_environment}-services"
  }
}
