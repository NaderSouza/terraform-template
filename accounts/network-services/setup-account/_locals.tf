# ==================================================================
# LOCALS
# ==================================================================
locals {
  account_name = "${local.client_name}-${local.environment}-services"
  client_name  = "teckSolucoes"

  contact_billing = {
    email_address = "@teckSolucoes.tech"
    name          = "fulano"
    phone_number  = "+551234567890"
  }

  contact_operations = {
    email_address = "teckSolucoes.tech"
    name          = "fulano"
    phone_number  = "+5511234567890"
  }

  contact_security = {
    email_address = "@teckSolucoes.tech"
    name          = "fulano"
    phone_number  = "+551234567890"
  }
  environment                       = "network"
  tag_cost_allocation_business_unit = "shared"
  tag_cost_allocation_product       = "setup-account"
  tag_operation_support_team        = "aws-administrator"
  tag_operation_support_criticality = "low"
}
