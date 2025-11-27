locals {
  # ==================================================================
  # GENERAL
  # ==================================================================
  client_name = "teckSolucoes"
  # ==================================================================
  # AWS GENERAL
  # ==================================================================
  aws_account_id              = data.aws_caller_identity.current.account_id
  aws_certificate_arn_default = data.aws_acm_certificate.selected.arn
  aws_default_tags = {
    cost_allocation_business_unit  = "teckSolucoes"
    cost_allocation_product        = "teckSolucoes"
    operation_support_account_name = "${local.client_name}-${local.aws_environment}-services"
    operation_support_criticality  = "medium"
    operation_support_environment  = local.aws_environment
    operation_support_team         = "cloud"
    source_code                    = "https://gitlab.com/nuageit/delivery/teckSolucoes/cloud-management"
    source_project                 = "setup-rancher"
  }
  aws_dns_default = "shared.teckSolucoes.tech"
  aws_environment = "shared"
  aws_region      = "us-east-1"
  # ==================================================================
  # AWS NETWORK
  # ==================================================================
  aws_network = {
    vpc_name           = "vpc-${local.aws_environment}-services"
    subnet_public_ids  = data.aws_subnets.public.ids
    subnet_private_ids = data.aws_subnets.private.ids
  }
  # ==================================================================
  # RANCHER
  # ==================================================================
  rancher_instance = {
    docker_version = "20.10"
    name           = "rancher-${local.aws_environment}-services"
    server_url     = "rancher.${local.aws_dns_default}"
    version        = "2.8.2"
  }
}
