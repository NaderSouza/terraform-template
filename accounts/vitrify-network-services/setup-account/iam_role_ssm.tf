# ==================================================================
# AWS IAM - ROLE SSM
# ==================================================================
resource "aws_iam_role" "ssm" {
  name = "custom-role-ssm"

  assume_role_policy = file("${path.root}/files/policy/ssm-policy.tpl")

  tags = {
    Name = "custom-role-ssm"
  }
}

# Políticas gerenciadas
resource "aws_iam_role_policy_attachment" "ssm_ssm_core" {
  role       = aws_iam_role.ssm.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "ssm_cloudwatch_agent" {
  role       = aws_iam_role.ssm.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

# Instance Profile
resource "aws_iam_instance_profile" "ssm" {
  role = aws_iam_role.ssm.name
  name = "custom-role-ssm"

  tags = {
    Name = "custom-role-ssm"
  }
}
