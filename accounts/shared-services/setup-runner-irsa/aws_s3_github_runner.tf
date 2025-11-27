# ==================================================================
# MODULE - AWS S3 - github RUNNER CACHE BUCKET
# ==================================================================

module "github_runner_cache_s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 4.6"

  bucket                                = "${local.aws_account_id}-${local.aws_eks.cluster_name}-github-runner-cache"
  acl                                   = "private"
  force_destroy                         = true
  control_object_ownership              = true
  object_ownership                      = "ObjectWriter"
  attach_deny_insecure_transport_policy = true
  attach_require_latest_tls_policy      = true
  versioning = {
    status     = true
    mfa_delete = false
  }
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "aws:kms"
      }
    }
  }
  lifecycle_rule = [
    {
      id      = "github-runner-cache-lifecycle-rule"
      enabled = true
      filter = {
        prefix = ""
      }
      expiration = {
        days = 120
      }
    },
  ]
}
