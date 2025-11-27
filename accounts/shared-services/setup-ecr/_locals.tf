locals {
  # ==================================================================
  # GENERAL
  # ==================================================================
  client_name = "teckSolucoes"

  # ==================================================================
  # AWS GENERAL
  # ==================================================================
  aws_account_id  = "157489942873"
  aws_dns_default = "shared.teckSolucoes.tech"
  aws_environment = "shared"
  aws_region      = "us-east-1"

  # ==================================================================
  # ELASTIC CONTAINER REGISTRY - ECR
  # ==================================================================
  # ecr_repository_name = "${local.aws_account_id}/${local.client_name}/${local.aws_environment}"
  ecr_repository_name = "teckSolucoes/stage"

  # ==================================================================
  # AWS TAGS
  # ==================================================================
  aws_default_tags = {
    cost_allocation_business_unit  = "${local.aws_environment}"
    cost_allocation_product        = "setup-ecr"
    operation_support_account_name = "${local.client_name}-${local.aws_environment}-services"
    operation_support_criticality  = "medium"
    operation_support_environment  = local.aws_environment
    operation_support_team         = "cloud"
    source_code                    = "https://gitlab.com/nuageit/delivery/${local.client_name}/cloud-management"
    source_project                 = "setup-ecr"
  }
}
