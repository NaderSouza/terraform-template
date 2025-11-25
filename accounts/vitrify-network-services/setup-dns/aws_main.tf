# ==================================================================
# MODULE - AWS SA-EAST-1
# ==================================================================

# module "sa_east_1" {
#   source = "./sa-east-1"
#   providers = {
#     aws = aws.sa-east-1
#   }

#   aws_dns_default = local.aws_dns_default
#   aws_zone_id     = module.public_zones.route53_zone_zone_id[local.aws_dns_default]
# }

# ==================================================================
# MODULE - AWS US-EAST-1
# ==================================================================

module "us_east_1" {
  source = "./us-east-1"
  providers = {
    aws = aws.us-east-1
  }

  aws_dns_default = local.aws_dns_default
  aws_zone_id     = module.public_zones.route53_zone_zone_id[local.aws_dns_default]
}
