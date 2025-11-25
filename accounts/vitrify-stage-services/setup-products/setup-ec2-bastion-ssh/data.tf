data "aws_vpc" "selected" {
  id = var.vpc_id
}

data "aws_subnet" "selected" {
  id = var.subnet_id
}

data "aws_iam_instance_profile" "ssm" {
  name = var.iam_profile_name
}
