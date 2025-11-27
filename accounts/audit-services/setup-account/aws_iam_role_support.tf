# ==================================================================
# AWS IAM ROLE - AWS SUPPORT
# ==================================================================

resource "aws_iam_role" "aws_support" {
  name                 = "custom-role-aws-support"
  assume_role_policy   = data.aws_iam_policy_document.aws_support.json
  managed_policy_arns  = ["arn:aws:iam::aws:policy/AWSSupportAccess"]
  max_session_duration = 3600
  tags = {
    Name = "custom-role-aws-support"
  }
}
