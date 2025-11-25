# ==================================================================
# OUTPUTS - AWS VPC
# ==================================================================

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "vpc_cidr" {
  description = "VPC CIDR Block"
  value       = module.vpc.vpc_cidr_block
}

output "vpc_owner" {
  description = "VPC Owner ID"
  value       = module.vpc.vpc_owner_id
}

# ==================================================================
# OUTPUTS - AWS INTERNET GATEWAY
# ==================================================================

output "igw" {
  description = "The ID of the Internet Gateway"
  value       = module.vpc.igw_id
}

# ==================================================================
# OUTPUTS - AWS SUBNETS
# ==================================================================

output "subnet_database_ids" {
  description = "List of IDs of database subnets"
  value       = module.vpc.database_subnets
}

output "subnet_database_cidr_blocks" {
  description = "List of database CIDR blocks"
  value       = module.vpc.database_subnets_cidr_blocks
}

output "subnet_intra_ids" {
  description = "List of IDs of intra subnets"
  value       = module.vpc.intra_subnets
}

output "subnet_intra_cidr_blocks" {
  description = "List of intra CIDR blocks"
  value       = module.vpc.intra_subnets_cidr_blocks
}

output "subnet_private_ids" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "subnet_private_cidr_blocks" {
  description = "List of private CIDR blocks"
  value       = module.vpc.private_subnets_cidr_blocks
}

output "subnet_public_ids" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

output "subnet_public_cidr_blocks" {
  description = "List of public CIDR blocks"
  value       = module.vpc.public_subnets_cidr_blocks
}

output "route_table_private" {
  description = "List of Private CIDR blocks"
  value       = module.vpc.private_route_table_ids
}

output "route_table_database" {
  description = "List of Database CIDR blocks"
  value       = module.vpc.database_route_table_ids
}
