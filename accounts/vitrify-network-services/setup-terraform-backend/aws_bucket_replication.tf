# ==================================================================
# AWS S3 - TERRAFORM REMOTE STATE REPLICATION
# ==================================================================

module "s3_bucket_replication" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 3.15"

  providers = {
    aws = aws.us-east-1
  }
  bucket                                = "${local.aws_account_id}-tf-remote-state1-replication"
  acl                                   = "private"
  force_destroy                         = true
  control_object_ownership              = true
  object_ownership                      = "ObjectWriter"
  attach_deny_insecure_transport_policy = true
  policy                                = data.aws_iam_policy_document.allow_tf_remote_state_from_root_account.json
  versioning = {
    enabled    = true
    mfa_delete = false
  }
  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = module.kms_bucket_replication.key_arn
      }
    }
  }
  lifecycle_rule = [
    {
      id      = "main"
      enabled = true
      abort_incomplete_multipart_upload = {
        days_after_initiation = "7"
      }
      expiration = {
        days = 730
      }
      transition = {
        days          = 90
        storage_class = "STANDARD_IA"
      }
      transition = {
        days          = 365
        storage_class = "GLACIER"
      }
      noncurrent_version_transition = {
        noncurrent_days = 90
        storage_class   = "STANDARD_IA"
      }
      noncurrent_version_transition = {
        noncurrent_days = 365
        storage_class   = "GLACIER"
      }
      noncurrent_version_expiration = {
        noncurrent_days = 730
      }
    }
  ]
}
