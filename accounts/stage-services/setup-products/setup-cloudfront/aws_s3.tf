# ==================================================================
# MODULE - AWS S3 BUCKET - CLOUDFRONT
# ==================================================================

locals {
  cloudfronts_indexed = {
    for cf in local.application.cloudfronts : cf.bucket => cf
  }
}

module "s3_cloudfront" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 4.6"

  for_each      = local.cloudfronts_indexed
  bucket        = each.value.bucket
  force_destroy = true
  versioning = {
    status     = true
    mfa_delete = false
  }
  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = local.aws_default_tags
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  for_each = local.cloudfronts_indexed
  bucket   = module.s3_cloudfront[each.value.bucket].s3_bucket_id
  policy   = data.aws_iam_policy_document.s3[each.value.bucket].json
}

data "aws_iam_policy_document" "s3" {
  for_each = local.cloudfronts_indexed
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${module.s3_cloudfront[each.value.bucket].s3_bucket_arn}/*"]
    principals {
      type        = "AWS"
      identifiers = module.cloudfront[each.value.bucket].cloudfront_origin_access_identity_iam_arns
    }
  }
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${module.s3_cloudfront[each.value.bucket].s3_bucket_arn}/*"]
    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }
  }
}

# ==================================================================
# S3 - UPLOAD SITE
# ==================================================================
resource "aws_s3_object" "index" {
  for_each     = local.cloudfronts_indexed
  bucket       = each.value.bucket
  key          = "index.html"
  source       = "${path.module}/files/index.html"
  content_type = "text/html"
  depends_on = [module.s3_cloudfront]
}
