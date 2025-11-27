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
# OUTPUTS - AWS SA-EAST-1
# ==================================================================

/*output "vpc_id_sa" {
  description = "VPC ID sa-east-1 region"
  value       = module.sa_east_1.vpc_id
}

output "vpc_cidr_sa" {
  description = "VPC CIDR sa-east-1 region"
  value       = module.sa_east_1.vpc_cidr
}

output "subnet_database_ids_sa" {
  description = "Subnet database IDs sa-east-1 region"
  value       = module.sa_east_1.subnet_database_ids
}

output "subnet_database_cidr_blocks_sa" {
  description = "List of database CIDR blocks sa-east-1 region"
  value       = module.sa_east_1.subnet_database_cidr_blocks
}

output "subnet_intra_ids_sa" {
  description = "Subnet intra IDs sa-east-1 region"
  value       = module.sa_east_1.subnet_intra_ids
}

output "subnet_intra_cidr_blocks_sa" {
  description = "List of intra CIDR blocks sa-east-1 region"
  value       = module.sa_east_1.subnet_intra_cidr_blocks
}

output "subnet_private_ids_sa" {
  description = "Subnet private IDs sa-east-1 region"
  value       = module.sa_east_1.subnet_private_ids
}

output "subnet_private_cidr_blocks_sa" {
  description = "List of private CIDR blocks sa-east-1 region"
  value       = module.sa_east_1.subnet_private_cidr_blocks
}

output "subnet_public_ids_sa" {
  description = "Subnet public IDs sa-east-1 region"
  value       = module.sa_east_1.subnet_public_ids
}

output "subnet_public_cidr_blocks_sa" {
  description = "List of public CIDR blocks sa-east-1 region"
  value       = module.sa_east_1.subnet_public_cidr_blocks
}*/

# ==================================================================
# OUTPUTS - AWS US-EAST-1
# ==================================================================

output "vpc_id_us" {
  description = "VPC ID us-east-1 region"
  value       = module.us_east_1.vpc_id
}

output "vpc_cidr_us" {
  description = "VPC CIDR us-east-1 region"
  value       = module.us_east_1.vpc_cidr
}

output "subnet_database_ids_us" {
  description = "Subnet database IDs us-east-1 region"
  value       = module.us_east_1.subnet_database_ids
}

output "subnet_database_cidr_blocks_us" {
  description = "List of database CIDR blocks us-east-1 region"
  value       = module.us_east_1.subnet_database_cidr_blocks
}

output "subnet_intra_ids_us" {
  description = "Subnet intra IDs us-east-1 region"
  value       = module.us_east_1.subnet_intra_ids
}

output "subnet_intra_cidr_blocks_us" {
  description = "List of intra CIDR blocks us-east-1 region"
  value       = module.us_east_1.subnet_intra_cidr_blocks
}

output "subnet_private_ids_us" {
  description = "Subnet private IDs us-east-1 region"
  value       = module.us_east_1.subnet_private_ids
}

output "subnet_private_cidr_blocks_us" {
  description = "List of private CIDR blocks us-east-1 region"
  value       = module.us_east_1.subnet_private_cidr_blocks
}

output "subnet_public_ids_us" {
  description = "Subnet public IDs us-east-1 region"
  value       = module.us_east_1.subnet_public_ids
}

output "subnet_public_cidr_blocks_us" {
  description = "List of public CIDR blocks us-east-1 region"
  value       = module.us_east_1.subnet_public_cidr_blocks
}
