# ==================================================================
# OUTPUTS - AWS ACCOUNT
# ==================================================================

output "aws_account_id" {
  description = "AWS Account ID being used"
  value       = data.aws_caller_identity.current.account_id
}

output "aws_account_region" {
  description = "AWS Region where resources are being created"
  value       = data.aws_region.current.name
}

# ==================================================================
# OUTPUTS - AWS IAM ROLE
# ==================================================================

output "github_oidc_cloudfront_role_arn" {
  description = "ARN of the github OIDC CloudFront role"
  value       = module.iam_github_oidc_cloudfront_role.iam_role_arn
}

output "github_oidc_container_role_arn" {
  description = "ARN of the github OIDC Default role"
  value       = module.iam_github_oidc_container_role.iam_role_arn
}

output "github_oidc_serverless_role_arn" {
  description = "ARN of the github OIDC Serverless role"
  value       = module.iam_github_oidc_serverless_role.iam_role_arn
}
