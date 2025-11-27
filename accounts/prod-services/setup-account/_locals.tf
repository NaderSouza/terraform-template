locals {
  # ==================================================================
  # GENERAL
  # ==================================================================
  client_name = "teckSolucoes"

  # ==================================================================
  # AWS GENERAL
  # ==================================================================
  aws_account_id = data.aws_caller_identity.current.account_id
  aws_default_tags = {
    cost_allocation_business_unit  = "teckSolucoes"
    cost_allocation_product        = "teckSolucoes"
    operation_support_account_name = "${local.client_name}-${local.aws_environment}-services"
    operation_support_criticality  = "medium"
    operation_support_environment  = local.aws_environment
    operation_support_team         = "cloud"
    source_code                    = "https://gitlab.com/nuageit/delivery/teckSolucoes/cloud-management"
    source_project                 = "setup-account"
  }
  aws_environment = "prod"
  aws_region      = "us-east-1"

  # ==================================================================
  # AWS CONTACTS
  # ==================================================================

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
}
