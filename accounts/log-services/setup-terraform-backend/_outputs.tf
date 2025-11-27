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
# OUTPUTS - AWS BUCKET
# ==================================================================

output "aws_bucket_arn" {
  description = "The S3 Bucket ARN used to store your Terraform States"
  value       = module.s3_bucket.s3_bucket_arn
}

output "aws_bucket_id" {
  description = "The S3 Bucket ID used to store your Terraform States"
  value       = module.s3_bucket.s3_bucket_id
}

# ==================================================================
# OUTPUTS - AWS DYNAMODB
# ==================================================================

output "aws_dynamodb_arn" {
  description = "The DynamoDB ARN used to lock your Terraform States"
  value       = aws_dynamodb_table.terraform.arn
}

output "aws_dynamodb_id" {
  description = "The DynamoDB ID used to lock your Terraform States"
  value       = aws_dynamodb_table.terraform.id
}
