# ==================================================================
# MODULE AWS ROUTE53 RECORDS - PUBLIC
# ==================================================================

module "records_public_rancher" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.11"

  zone_id = data.aws_route53_zone.public_zone.id
  records = [
    {
      name = "rancher"
      type = "A"
      alias = {
        name    = aws_lb.rancher.dns_name
        zone_id = aws_lb.rancher.zone_id
      }
    }
  ]
  depends_on = [aws_lb.rancher]
}

# ==================================================================
# MODULE AWS ROUTE53 RECORDS - PRIVATE
# ==================================================================

module "records_private_rancher" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.11"

  zone_id = data.aws_route53_zone.private_zone.id
  records = [
    {
      name = "rancher"
      type = "A"
      alias = {
        name    = aws_lb.rancher.dns_name
        zone_id = aws_lb.rancher.zone_id
      }
    }
  ]
  depends_on = [aws_lb.rancher]
}
