# ==================================================================
# AWS KMS - DYNAMODB
# ==================================================================

module "kms_dynamodb" {
  source  = "terraform-aws-modules/kms/aws"
  version = "~> 2.1"

  description             = "Setup KMS used by DynamoDB encryption in Terraform backend"
  deletion_window_in_days = 7
  enable_key_rotation     = true
  enable_default_policy   = true
  aliases                 = ["tf-remote-state/dynamodb-lock"]
}
