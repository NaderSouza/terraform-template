################################################################################
# VPC
################################################################################

output "vpc" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "vpc_cidr" {
  description = "VPC ID"
  value       = module.vpc.vpc_cidr_block
}

output "vpc_owner" {
  description = "VPC ID"
  value       = module.vpc.vpc_owner_id
}

################################################################################
# Internet Gateway
################################################################################

output "igw" {
  description = "The ID of the Internet Gateway"
  value       = module.vpc.igw_id
}

################################################################################
# Private Subnets
################################################################################

output "subnet_private_ids" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

################################################################################
# Publiс Subnets
################################################################################

output "subnet_public_ids" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

################################################################################
# Transit Gateway
################################################################################

output "tgw_id" {
  description = "Transit Gateway ID"
  value       = module.tgw.ec2_transit_gateway_id
}

output "tgw_troute_tabe_id" {
  description = "Transit Gateway Route Table ID"
  value       = module.tgw.ec2_transit_gateway_route_table_id
}
