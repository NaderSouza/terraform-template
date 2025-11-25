# ==================================================================
# DATAS - AWS
# ==================================================================

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

# ==================================================================
# DATAS - AWS IAM
# ==================================================================

data "aws_iam_policy_document" "aws_support" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type        = "AWS"
      identifiers = [format("arn:aws:iam::%s:root", local.aws_account_id)]
    }
    condition {
      test     = "Bool"
      variable = "aws:MultiFactorAuthPresent"
      values   = ["true"]
    }
  }
}
