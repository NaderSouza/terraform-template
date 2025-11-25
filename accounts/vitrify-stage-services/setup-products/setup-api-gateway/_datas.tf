data "aws_acm_certificate" "api_gateway_cert" {
  domain      = local.acm_certificate_domain
  statuses    = ["ISSUED"]
}

data "aws_route53_zone" "public" {
  name         = local.aws_domain
  private_zone = false
}

# DATAS - AWS NETWORK
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
      "subnet-${local.aws_environment}-services-publish-us-east-1a",
      "subnet-${local.aws_environment}-services-publish-us-east-1b",
      "subnet-${local.aws_environment}-services-publish-us-east-1c",
    ]
  }
}
