locals {
  # ==================================================================
  # GENERAL
  # ==================================================================
  client_name = "nava"

  # ==================================================================
  # APPLICATION
  # ==================================================================
  application = {
    cloudfronts = [
      {
        bucket  = "nava-cdn-site-${local.aws_environment}",
        aliases = ["cdn.${local.aws_dns_default}"],
        records = ["cdn"]
      }
    ]
  }
  # ==================================================================
  # AWS GENERAL
  # ==================================================================
  aws_account_id  = "484852752690"
  aws_dns_default = "stage.sphereai.nava.com.br"
  aws_environment = "stage"
  aws_region      = "us-east-1"

  # ==================================================================
  # AWS TAGS
  # ==================================================================
  aws_default_tags = {
    cost_allocation_business_unit  = "${local.aws_environment}"
    cost_allocation_product        = "setup-cloudfront"
    operation_support_account_name = "${local.client_name}-${local.aws_environment}-services"
    operation_support_criticality  = "medium"
    operation_support_environment  = local.aws_environment
    operation_support_team         = "cloud"
    source_code                    = "https://gitlab.com/nuageit/delivery/${local.client_name}/cloud-management"
    source_project                 = "setup-cloudfront"
  }
}
