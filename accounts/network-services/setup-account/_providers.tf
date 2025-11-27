# ==================================================================
# TERRAFORM - PROVIDERS
# ==================================================================
provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      "automation:managedby"          = "terraform",
      "cost-allocation:business-unit" = local.tag_cost_allocation_business_unit,
      "cost-allocation:product"       = local.tag_cost_allocation_product,
      "operation-support:account"     = local.account_name,
      "operation-support:environment" = local.environment,
      "operation-support:team"        = local.tag_operation_support_team,
      "operation-support:criticality" = local.tag_operation_support_criticality
    }
  }
}
