# ==================================================================
# AWS IAM ROLE - SSM
# ==================================================================

resource "aws_iam_role" "ssm" {
  name = "custom-role-ssm"
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy",
  ]
  assume_role_policy = file("${path.root}/files/policy/ssm-policy.tpl")
  tags = {
    Name = "custom-role-ssm"
  }
}
