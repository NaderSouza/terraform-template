# ==================================================================
# OUTPUTS - AWS ACM
# ==================================================================

output "acm_certificate_arn" {
  description = "The ARN of the ACM certificate"
  value       = module.acm_default.acm_certificate_arn
}
