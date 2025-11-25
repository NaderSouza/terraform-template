locals {
  # ==================================================================
  # GENERAL
  # ==================================================================
  client_name = "vitrify"

  # ==================================================================
  # AWS GENERAL
  # ==================================================================
  aws_environment = "prod"
  aws_region      = "us-east-1"

  # ==================================================================
  # AWS ACM & ROUTE53
  # ==================================================================
  aws_domain             = "vitrify.tech"
  acm_certificate_domain = "vitrify.tech"

  # ==================================================================
  # LABELS
  # ==================================================================
  labels = {
    cost_allocation_business_unit = local.aws_environment
  }

  # ==================================================================
  # AWS TAGS
  # ==================================================================
  aws_default_tags = {
    cost_allocation_business_unit  = local.aws_environment
    cost_allocation_product        = "setup-api-gateway"
    operation_support_account_name = "${local.client_name}-${local.aws_environment}-services"
    operation_support_criticality  = "medium"
    operation_support_environment  = local.aws_environment
    operation_support_team         = "cloud"
    source_code                    = "https://gitlab.com/nuageit/delivery/${local.client_name}/cloud-management"
    source_project                 = "setup-api-gateway"
  }
}

