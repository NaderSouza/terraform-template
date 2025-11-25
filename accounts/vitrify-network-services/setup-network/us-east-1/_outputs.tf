# ==============================================================================
# OUTPUT - VPC
# ==============================================================================

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

# ==============================================================================
# OUTPUT - INTERNET GATEWAY
# ==============================================================================

output "igw" {
  description = "The ID of the Internet Gateway"
  value       = module.vpc.igw_id
}

# ==============================================================================
# OUTPUT - PRIVATE SUBNETS
# ==============================================================================

output "subnet_private_ids" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

# ==============================================================================
# OUTPUT - PUBLIC SUBNETS
# ==============================================================================

output "subnet_public_ids" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}


# ==============================================================================
# OUTPUT - TRANSIT GATEWAY 
# ==============================================================================

output "tgw_id" {
  description = "Transit Gateway ID"
  value       = module.tgw.ec2_transit_gateway_id
}

output "tgw_troute_tabe_id" {
  description = "Transit Gateway Route Table ID"
  value       = module.tgw.ec2_transit_gateway_route_table_id
}

