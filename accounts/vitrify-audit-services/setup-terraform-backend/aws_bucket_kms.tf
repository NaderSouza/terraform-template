# ==================================================================
# AWS KMS - BUCKET
# ==================================================================

module "kms_bucket" {
  source  = "terraform-aws-modules/kms/aws"
  version = "~> 2.1"

  description             = "Setup KMS used by S3 Bucket encryption in Terraform backend"
  deletion_window_in_days = 30
  enable_key_rotation     = true
  enable_default_policy   = true
  policy                  = data.aws_iam_policy_document.bucket_encryption.json
  aliases                 = ["tf-remote-state/bucket"]
}
