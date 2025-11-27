locals {
  # ==================================================================
  # GENERAL
  # ==================================================================
  client_name = "teckSolucoes"

  # ==================================================================
  # AWS GENERAL
  # ==================================================================
  aws_account_id = data.aws_caller_identity.current.account_id
  aws_default_tags = {
    cost_allocation_business_unit  = "${local.aws_environment}"
    cost_allocation_product        = "setup-terraform-backend"
    operation_support_account_name = "${local.client_name}-${local.aws_environment}-services"
    operation_support_criticality  = "medium"
    operation_support_environment  = local.aws_environment
    operation_support_team         = "cloud"
    source_code                    = "https://gitlab.com/nuageit/delivery/${local.client_name}/cloud-management"
    source_project                 = "setup-terraform-backend"
  }
  aws_environment = "log"
  aws_region      = "us-east-1"

  # ==================================================================
  # AWS TERRAFORM BACKEND
  # ==================================================================
  aws_buckets            = flatten([module.s3_bucket.s3_bucket_arn])
  aws_replication_bucket = "arn:aws:s3:::${local.aws_account_id}-tf-remote-state-replication/*"
}
