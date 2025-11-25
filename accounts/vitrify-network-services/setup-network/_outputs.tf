# ==================================================================
# OUTPUTS
# ==================================================================
# output "tgw_id_sa" {
#   description = "Transit Gateway ID sa-east-1 region"
#   value       = module.sa_east_1.tgw_id
# }

output "tgw_id_us" {
  description = "Transit Gateway ID us-east-1 region"
  value       = module.us_east_1.tgw_id
}

# output "peering_cidr_sa" {
#   description = "CIDR Range Peering sa-east-1 region"
#   value       = local.peering_cidr_sa
# }

output "peering_cidr_us" {
  description = "CIDR Range Peering us-east-1 region"
  value       = local.peering_cidr_us
}

