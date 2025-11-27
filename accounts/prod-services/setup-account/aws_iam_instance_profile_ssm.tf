# ==================================================================
# AWS IAM INSTANCE PROFILE - SSM
# ==================================================================

resource "aws_iam_instance_profile" "ssm" {
  name = "custom-role-ssm"
  role = aws_iam_role.ssm.name
  tags = {
    Name = "custom-role-ssm"
  }
}
