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
    source_project                 = "setup-account"
  }
  aws_environment = "prod"
  aws_region      = "us-east-1"

  # ==================================================================
  # AWS CONTACTS
  # ==================================================================

  contact_billing = {
    email_address = "edson.lopes@vitrify.tech"
    name          = "Edson Lopes da Silva Filho"
    phone_number  = "+5511989473100"
  }

  contact_operations = {
    email_address = "alexandre.yoshimatsu@vitrify.tech"
    name          = "Alexandre Pantalena Yoshimatsu"
    phone_number  = "+5511992775177"
  }

  contact_security = {
    email_address = "alexandre.yoshimatsu@vitrify.tech"
    name          = "Alexandre Pantalena Yoshimatsu"
    phone_number  = "+5511992775177"
  }
}
