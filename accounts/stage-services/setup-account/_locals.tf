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
    cost_allocation_business_unit  = "${local.aws_environment}"
    cost_allocation_product        = "setup-account"
    operation_support_account_name = "${local.client_name}-${local.aws_environment}-services"
    operation_support_criticality  = "medium"
    operation_support_environment  = local.aws_environment
    operation_support_team         = "cloud"
    source_code                    = "https://gitlab.com/nuageit/delivery/${local.client_name}/cloud-management"
    source_project                 = "setup-account"
  }
  aws_environment = "stage"
  aws_region      = "us-east-1"

  # ==================================================================
  # AWS CONTACTS
  # ==================================================================
  # aws_contact_billing = {
  #   email_address = ""
  #   name          = ""
  #   phone_number  = ""
  # }
  # aws_contact_operations = {
  #   email_address = ""
  #   name          = ""
  #   phone_number  = ""
  # }
  # aws_contact_security = {
  #   email_address = ""
  #   name          = ""
  #   phone_number  = ""
  # }
}
