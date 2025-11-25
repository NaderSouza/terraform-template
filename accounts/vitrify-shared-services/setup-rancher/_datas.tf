# ==================================================================
# DATAS - AWS
# ==================================================================

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

# ==================================================================
# DATAS - AWS ACMS
# ==================================================================

data "aws_acm_certificate" "selected" {
  domain    = local.aws_dns_default
  types     = ["AMAZON_ISSUED"]
  key_types = ["RSA_2048", "RSA_4096"]
}

# ==================================================================
# DATAS - AWS EC2
# ==================================================================

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
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

data "aws_subnets" "public" {
  filter {
    name = "tag:Name"
    values = [
      "subnet-${local.aws_environment}-services-public-${local.aws_region}a",
      "subnet-${local.aws_environment}-services-public-${local.aws_region}b"
      # "subnet-${local.aws_environment}-services-public-${local.aws_region}c"
    ]
  }
}
data "aws_subnets" "private" {
  filter {
    name = "tag:Name"
    values = [
      "subnet-${local.aws_environment}-services-private-${local.aws_region}a",
      "subnet-${local.aws_environment}-services-private-${local.aws_region}b"
      # "subnet-${local.aws_environment}-services-private-${local.aws_region}c"
    ]
  }
}

# ==================================================================
# DATAS - AWS ROUTE53
# ==================================================================

data "aws_route53_zone" "public_zone" {
  name         = local.aws_dns_default
  private_zone = false
}

data "aws_route53_zone" "private_zone" {
  name         = local.aws_dns_default
  private_zone = true
}
