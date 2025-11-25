# # ==================================================================
# # MODULE AWS ACM - DEFAULT
# # ==================================================================

# module "acm_default" {
#   source  = "terraform-aws-modules/acm/aws"
#   version = "~> 5.0"

#   domain_name       = var.aws_dns_default
#   zone_id           = var.aws_zone_id
#   validation_method = "DNS"
#   subject_alternative_names = [
#     "*.${var.aws_dns_default}",
#   ]
#   wait_for_validation    = false
#   validate_certificate   = true
#   create_route53_records = true
# }
