# ==================================================================
# LOCALS
# ==================================================================
locals {
  account_name = "${local.client_name}-${local.environment}-services"
  client_name  = "teckSolucoes"
  environment  = "network"
  #  peering_cidr_sa                   = "10.49.0.0/16"
  peering_cidr_us                   = "10.164.0.0/16"
  tag_cost_allocation_business_unit = "teckSolucoes"
  tag_cost_allocation_product       = "setup-network"
  tag_operation_support_team        = "network"
  tag_operation_support_criticality = "high"
}
