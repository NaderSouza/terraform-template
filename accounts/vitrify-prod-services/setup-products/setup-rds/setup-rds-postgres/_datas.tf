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
    name = "tag:Name"
    values = [
      "subnet-${local.aws_environment}-services-database-${local.aws_region}a",
      "subnet-${local.aws_environment}-services-database-${local.aws_region}b",
      "subnet-${local.aws_environment}-services-database-${local.aws_region}c"
    ]
  }
}
