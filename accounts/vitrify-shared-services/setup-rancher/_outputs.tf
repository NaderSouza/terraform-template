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

# ==================================================================
# OUTPUTS - RANCHER
# ==================================================================

output "rancher_server_url" {
  description = "Rancher Server URL"
  value       = local.rancher_instance.server_url
}

output "rancher_alb_dns_name" {
  description = "Rancher ALB DNS Name"
  value       = aws_lb.rancher.dns_name
}
