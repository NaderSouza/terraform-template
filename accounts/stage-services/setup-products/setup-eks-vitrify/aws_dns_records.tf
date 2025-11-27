# ==================================================================
# MODULE AWS DNS RECORDS - SECURITY
# ==================================================================

module "records_security_public" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.11"

  zone_id = data.aws_route53_zone.public_zone.zone_id
  records = [
    {
      name = "*"
      type = "A"
      alias = {
        name    = data.aws_lb.this.dns_name
        zone_id = data.aws_lb.this.zone_id
      }
    },
  ]
}

# ==================================================================
# MODULE AWS DNS RECORDS - SECURITY
# ==================================================================

module "records_security_private" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.11"

  zone_id = data.aws_route53_zone.private_zone.zone_id
  records = [
    {
      name = "*"
      type = "A"
      alias = {
        name    = data.aws_lb.this.dns_name
        zone_id = data.aws_lb.this.zone_id
      }
    },
  ]
}
