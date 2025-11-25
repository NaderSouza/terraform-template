# ==================================================================
# DATAS - AWS
# ==================================================================

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

# ==================================================================
# DATAS - AWS IAM DYNAMODB
# ==================================================================

data "aws_iam_policy_document" "dynamodb_encryption" {
  statement {
    effect  = "Allow"
    actions = ["kms:*"]

    resources = ["*"]

    principals {
      type        = "Service"
      identifiers = ["dynamodb.amazonaws.com"]
    }

    principals {
      type = "AWS"
      identifiers = [
        # "arn:aws:iam::${local.aws_account_id}:user/user-1",
        # "arn:aws:iam::${local.aws_account_id}:user/user-2",
        # "arn:aws:iam::${local.aws_account_id}:user/nuageitadm"
      ]
    }

    principals {
      type = "AWS"
      identifiers = [
        local.aws_account_id
      ]
    }
  }
}

# ==================================================================
# DATAS - AWS IAM S3
# ==================================================================

data "aws_iam_policy_document" "bucket_encryption" {
  statement {
    sid    = "Allow management access of the key"
    effect = "Allow"
    actions = [
      "kms:*"
    ]
    resources = [
      "*"
    ]
    principals {
      type = "AWS"
      identifiers = concat(
        [
          "arn:aws:iam::${local.aws_account_id}:root"
        ],
        [
          # "arn:aws:iam::${local.aws_account_id}:user/user-1",
          # "arn:aws:iam::${local.aws_account_id}:user/user-2",
          # "arn:aws:iam::${local.aws_account_id}:user/nuageitadm"
        ]
      )
    }
  }
  statement {
    sid    = "Allow key decryption to STS bucket replication roles"
    effect = "Allow"
    actions = [
      "kms:Decrypt*"
    ]
    resources = ["*"]
    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:sts::${local.aws_account_id}:assumed-role/custom-role-tf-remote-state1-replication-bucket/s3-replication"
      ]
    }
  }
}

# ==================================================================
# DATAS - AWS IAM S3
# ==================================================================

data "aws_iam_policy_document" "allow_tf_remote_state_from_root_account" {
  statement {
    sid       = "AllowListBucketFromRootAccount"
    effect    = "Allow"
    actions   = ["s3:ListBucket"]
    resources = [module.s3_bucket.s3_bucket_arn]

    principals {
      type = "AWS"
      identifiers = [
        # "arn:aws:iam::${local.aws_account_id}:user/user-1",
        # "arn:aws:iam::${local.aws_account_id}:user/user-2",
        # "arn:aws:iam::${local.aws_account_id}:user/nuageitadm"
      ]
    }
  }

  statement {
    sid       = "AllowGetObjectsFromRootAccount"
    effect    = "Allow"
    actions   = ["s3:GetObject"]
    resources = ["${module.s3_bucket.s3_bucket_arn}/*"]

    principals {
      type = "AWS"
      identifiers = [
        # "arn:aws:iam::${local.aws_account_id}:user/user-1",
        # "arn:aws:iam::${local.aws_account_id}:user/user-2",
        # "arn:aws:iam::${local.aws_account_id}:user/nuageitadm"
      ]
    }
  }

  statement {
    sid       = "AllowPutObjectsFromRootAccounts"
    effect    = "Allow"
    actions   = ["s3:PutObject"]
    resources = ["${module.s3_bucket.s3_bucket_arn}/*"]

    principals {
      type = "AWS"
      identifiers = [
        # "arn:aws:iam::${local.aws_account_id}:user/user-1",
        # "arn:aws:iam::${local.aws_account_id}:user/user-2",
        # "arn:aws:iam::${local.aws_account_id}:user/nuageitadm"
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values   = ["bucket-owner-full-control"]
    }
  }
}
