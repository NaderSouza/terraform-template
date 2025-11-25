# ==================================================================
# DATAS - AWS NETWORK
# ==================================================================

data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["vpc-${local.aws_environment}-services"]
  }
}

data "aws_subnets" "publish" {
  filter {
    name = "tag:Name"
    values = [
      "subnet-${local.aws_environment}-services-publish-${local.aws_region}a"
    ]
  }
}
