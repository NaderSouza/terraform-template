# ==================================================================
# MODULE - AWS ROUTE53 RECORDS - CLOUDFRONT
# ==================================================================
module "cloudfront_records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 5.0"

  for_each = local.cloudfronts_indexed
  zone_id  = data.aws_route53_zone.public_zone.zone_id
  records = [
    {
      name = each.value.records[0]
      type = "A"
      alias = {
        name                   = module.cloudfront[each.value.bucket].cloudfront_distribution_domain_name
        zone_id                = module.cloudfront[each.value.bucket].cloudfront_distribution_hosted_zone_id
        evaluate_target_health = false
      }
    }
  ]
}