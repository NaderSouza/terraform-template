# ==================================================================
# AWS KMS - BUCKET REPLICATION
# ==================================================================

module "kms_bucket_replication" {
  source  = "terraform-aws-modules/kms/aws"
  version = "~> 2.1"
  providers = {
    aws = aws.us-east-1
  }

  description             = "Setup KMS used by S3 replication Bucket encryption in Terraform backend"
  deletion_window_in_days = 30
  enable_key_rotation     = true
  enable_default_policy   = true
  policy                  = data.aws_iam_policy_document.bucket_encryption.json
  aliases                 = ["tf-remote-state/bucket-replication"]
}
