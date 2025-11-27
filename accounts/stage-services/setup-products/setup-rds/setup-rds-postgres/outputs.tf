# ===============================================
# RDS OUTPUT
# ===============================================

# output "db_postgres_instance_address" {
#   description = "The address of the RDS instance"
#   value       = module.db_postgres.db_instance_address
# }

output "db_postgres_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = module.db_postgres.db_instance_arn
}

output "db_postgres_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = module.db_postgres.db_instance_availability_zone
}

# output "db_postgres_instance_endpoint" {
#   description = "The connection endpoint"
#   value       = module.db_postgres.db_instance_endpoint
# }

output "db_postgres_instance_engine" {
  description = "The database engine"
  value       = module.db_postgres.db_instance_engine
}

output "db_postgres_instance_engine_version" {
  description = "The running version of the database"
  value       = module.db_postgres.db_instance_engine_version_actual
}

output "db_postgres_instance_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
  value       = module.db_postgres.db_instance_hosted_zone_id
}

output "db_postgres_instance_identifier" {
  description = "The RDS instance identifier"
  value       = module.db_postgres.db_instance_identifier
}

output "db_postgres_instance_resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = module.db_postgres.db_instance_resource_id
}

output "db_postgres_instance_status" {
  description = "The RDS instance status"
  value       = module.db_postgres.db_instance_status
}

output "db_postgres_instance_name" {
  description = "The database name"
  value       = module.db_postgres.db_instance_name
}

output "db_postgres_instance_username" {
  description = "The master username for the database"
  value       = module.db_postgres.db_instance_username
  sensitive   = true
}

output "db_postgres_instance_port" {
  description = "The database port"
  value       = module.db_postgres.db_instance_port
}

output "db_postgres_subnet_group_id" {
  description = "The db subnet group name"
  value       = module.db_postgres.db_subnet_group_id
}

output "db_postgres_subnet_group_arn" {
  description = "The ARN of the db subnet group"
  value       = module.db_postgres.db_subnet_group_arn
}

output "db_postgres_parameter_group_id" {
  description = "The db parameter group id"
  value       = module.db_postgres.db_parameter_group_id
}

output "db_postgres_parameter_group_arn" {
  description = "The ARN of the db parameter group"
  value       = module.db_postgres.db_parameter_group_arn
}

# output "db_postgres_instance_cloudwatch_log_groups" {
#   description = "Map of CloudWatch log groups created and their attributes"
#   value       = module.db_postgres.db_instance_cloudwatch_log_groups
# }

# output "db_postgres_master_user_secret_arn" {
#   description = "The ARN of the master user secret (Only available when manage_master_user_password is set to true)"
#   value       = module.db_postgres.db_instance_master_user_secret_arn
# }

# output "db_postgres_secretsmanager_secret_rotation_enabled" {
#   description = "Specifies whether automatic rotation is enabled for the secret"
#   value       = module.db_postgres.db_instance_secretsmanager_secret_rotation_enabled
# }
