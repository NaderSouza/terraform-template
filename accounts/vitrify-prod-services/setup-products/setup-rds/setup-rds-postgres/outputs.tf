# ===============================================
# RDS OUTPUT - SERVICES
# ===============================================

output "db_postgres_services_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = module.db_postgres_services.db_instance_arn
}

output "db_postgres_services_instance_identifier" {
  description = "The RDS instance identifier"
  value       = module.db_postgres_services.db_instance_identifier
}

output "db_postgres_services_instance_engine" {
  description = "The database engine"
  value       = module.db_postgres_services.db_instance_engine
}

output "db_postgres_services_instance_engine_version" {
  description = "The running version of the database"
  value       = module.db_postgres_services.db_instance_engine_version_actual
}

output "db_postgres_services_instance_status" {
  description = "The RDS instance status"
  value       = module.db_postgres_services.db_instance_status
}


# ===============================================
# RDS OUTPUT - DATA
# ===============================================

output "db_postgres_data_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = module.db_postgres_data.db_instance_arn
}

output "db_postgres_data_instance_identifier" {
  description = "The RDS instance identifier"
  value       = module.db_postgres_data.db_instance_identifier
}

output "db_postgres_data_instance_engine" {
  description = "The database engine"
  value       = module.db_postgres_data.db_instance_engine
}

output "db_postgres_data_instance_engine_version" {
  description = "The running version of the database"
  value       = module.db_postgres_data.db_instance_engine_version_actual
}

output "db_postgres_data_instance_status" {
  description = "The RDS instance status"
  value       = module.db_postgres_data.db_instance_status
}


# ===============================================
# RDS OUTPUT - KEYCLOAK
# ===============================================

output "db_postgres_keycloak_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = module.db_postgres_keycloak.db_instance_arn
}

output "db_postgres_keycloak_instance_identifier" {
  description = "The RDS instance identifier"
  value       = module.db_postgres_keycloak.db_instance_identifier
}

output "db_postgres_keycloak_instance_engine" {
  description = "The database engine"
  value       = module.db_postgres_keycloak.db_instance_engine
}

output "db_postgres_keycloak_instance_engine_version" {
  description = "The running version of the database"
  value       = module.db_postgres_keycloak.db_instance_engine_version_actual
}

output "db_postgres_keycloak_instance_status" {
  description = "The RDS instance status"
  value       = module.db_postgres_keycloak.db_instance_status
}
