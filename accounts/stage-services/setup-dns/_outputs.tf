# ==================================================================
# OUTPUTS - AWS
# ==================================================================

output "aws_account_id" {
  description = "Selected AWS Account ID"
  value       = local.aws_account_id
}

output "aws_region" {
  description = "Details about selected AWS region"
  value       = data.aws_region.current.name
}

output "aws_dns_default" {
  description = "Default DNS"
  value       = local.aws_dns_default
}

# ==================================================================
# OUTPUTS - AWS ACM
# ==================================================================

# output "aws_acm_certificate_arn_sa" {
#   description = "ACM Certificate ARN - South America"
#   value       = module.sa_east_1.acm_certificate_arn
# }

output "aws_acm_certificate_arn_us" {
  description = "ACM Certificate ARN - US East"
  value       = module.us_east_1.acm_certificate_arn
}

# ==================================================================
# OUTPUTS - AWS ROUTE 53
# ==================================================================

output "aws_route53_public_ns_records" {
  description = "Public Route 53 Name Server Records"
  value       = module.public_zones.route53_zone_name_servers[local.aws_dns_default]
}
