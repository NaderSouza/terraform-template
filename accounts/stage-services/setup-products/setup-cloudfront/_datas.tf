# ==================================================================
# DATAS - AWS
# ==================================================================

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

# ==================================================================
# DATAS - AWS ROUTE53
# ==================================================================

data "aws_route53_zone" "public_zone" {
  name         = local.aws_dns_default
  private_zone = false
}

# data "aws_route53_zone" "private_zone" {
#   name         = local.aws_dns_default
#   private_zone = true
# }

# ==================================================================
# DATAS - AWS ACMS
# ==================================================================

data "aws_acm_certificate" "client" {
  domain    = local.aws_dns_default
  types     = ["AMAZON_ISSUED"]
  key_types = ["RSA_2048", "RSA_4096"]
}
