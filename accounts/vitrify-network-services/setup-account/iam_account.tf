# ==================================================================
# AWS IAM ACCOUNT
# ==================================================================
module "iam_account" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-account"
  version = ">= 5.33"

  account_alias                  = local.account_name
  minimum_password_length        = 15
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  allow_users_to_change_password = true
  password_reuse_prevention      = 24
}
