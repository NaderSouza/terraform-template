# ==================================================================
# DATAS - AWS DEFAULTS
# ==================================================================

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

# ==================================================================
# DATAS - IAM INSTANCE PROFILE
# ==================================================================

data "aws_iam_instance_profile" "ssm_profile" {
  name = local.global.ec2.iam_profile
}

# ==================================================================
# DATAS - AWS NETWORK
# ==================================================================

data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = [local.aws_network.vpc_name]
  }
}

data "aws_subnets" "selected" {
  filter {
    name = "tag:Name"
    values = [
      "subnet-${local.aws_environment}-services-${local.aws_network.subnet_type}-${local.aws_region}a",
      "subnet-${local.aws_environment}-services-${local.aws_network.subnet_type}-${local.aws_region}b",
      "subnet-${local.aws_environment}-services-${local.aws_network.subnet_type}-${local.aws_region}c"
    ]
  }
}

data "aws_subnets" "database" {
  filter {
    name = "tag:Name"
    values = [
      "subnet-${local.aws_environment}-services-database-${local.aws_region}a",
    ]
  }
}