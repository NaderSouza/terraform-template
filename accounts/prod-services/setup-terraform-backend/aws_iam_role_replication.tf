# ==================================================================
# AWS IAM - ROLE
# ==================================================================

resource "aws_iam_role" "replication_bucket" {
  name               = "custom-role-tf-remote-state-replication-bucket"
  assume_role_policy = data.aws_iam_policy_document.replication_bucket_assume_role.json
}

data "aws_iam_policy_document" "replication_bucket_assume_role" {
  version = "2012-10-17"
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }
  }
}

# ==================================================================
# AWS IAM - POLICY
# ==================================================================

resource "aws_iam_policy" "replication_bucket" {
  name   = "custom-policy-tf-remote-state-replication-bucket"
  policy = data.aws_iam_policy_document.replication_bucket.json
}

data "aws_iam_policy_document" "replication_bucket" {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    actions = [
      "s3:GetReplicationConfiguration",
      "s3:ListBucket"
    ]
    resources = local.aws_buckets
  }

  statement {
    effect = "Allow"
    actions = [
      "s3:GetObjectVersion",
      "s3:GetObjectVersionAcl",
      "s3:GetObjectVersionForReplication",
      "s3:GetObjectLegalHold",
      "s3:GetObjectRetention",
      "s3:GetObjectVersionTagging"
    ]
    resources = [
      for bucket in local.aws_buckets :
      "${bucket}/*"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "s3:ReplicateObject",
      "s3:ReplicateDelete",
      "s3:ReplicateTags",
      "s3:GetObjectVersionTagging",
      "s3:ObjectOwnerOverrideToBucketOwner"
    ]

    resources = [local.aws_replication_bucket]

    condition {
      test     = "StringLikeIfExists"
      variable = "s3:x-amz-server-side-encryption"
      values = [
        "aws:kms",
        "AES256"
      ]
    }
  }
}

# ==================================================================
# AWS IAM - ATTACHMENT POLICY TO ROLE
# ==================================================================

resource "aws_iam_role_policy_attachment" "replication_bucket" {
  policy_arn = aws_iam_policy.replication_bucket.arn
  role       = aws_iam_role.replication_bucket.name
}
