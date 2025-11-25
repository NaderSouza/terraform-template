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
    operation_support_environment = local.aws_environment
    source_project                = "setup-secret-manager"
  }
  aws_environment = "security"
  aws_region      = "us-east-1"


  # ==================================================================
  # AWS SECRET MANAGER - DATABASE SECRET
  # ==================================================================
  secret_name = "example-secret"
  db_username = "db_username"
  db_password = "db_password"
}
