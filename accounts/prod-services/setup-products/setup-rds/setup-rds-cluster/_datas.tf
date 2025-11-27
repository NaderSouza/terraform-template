# ==================================================================
# DATAS - AWS
# ==================================================================

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

# ==================================================================
# DATAS - AWS NETWORK
# ==================================================================

data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = [local.aws_network.vpc_name]
  }
}

data "aws_subnets" "database" {
  filter {
    name   = "tag:Name"
    values = local.aws_network.subnet_ids
  }
}
