locals {
  client_name = "vitrify"
  # ==================================================================
  # AWS GENERAL
  # ==================================================================
  aws_account_id  = "499897076270"
  aws_environment = "security"
  aws_region      = "us-east-1"

  # ==================================================================
  # LABELS
  # ==================================================================
  aws_default_tags = {
    cost_allocation_business_unit  = "setup-waf"
    cost_allocation_product        = "${local.client_name}"
    operation_support_account_name = "${local.client_name}-${local.aws_environment}-services"
    operation_support_criticality  = "medium"
    operation_support_environment  = local.aws_environment
    operation_support_team         = "cloud"
    source_code                    = "https://gitlab.com/nuageit/delivery/${local.client_name}/cloud-management"
    source_project                 = "setup-waf"
  }

}
