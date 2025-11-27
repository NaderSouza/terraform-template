# ==================================================================
# ELASTIC CONTAINER REGISTRY - ECR PRIVATE
# ==================================================================
output "repository_private_arn" {
  description = "Full ARN of the repository"
  value       = module.private_ecr.repository_arn
}

output "repository_private_name" {
  description = "Name of the repository"
  value       = module.private_ecr.repository_name
}

output "repository_private_registry_id" {
  description = "The registry ID where the repository was created"
  value       = module.private_ecr.repository_registry_id
}

output "repository_private_url" {
  description = "The URL of the repository"
  value       = module.private_ecr.repository_url
}
# ==================================================================
# ELASTIC CONTAINER REGISTRY - ECR PUBLIC
# ==================================================================
# output "repository_public_arn" {
#   description = "Full ARN of the repository"
#   value       = module.public_ecr.repository_arn
# }

# output "repository_public_name" {
#   description = "Name of the repository"
#   value       = module.public_ecr.repository_name
# }

# output "repository_public_registry_id" {
#   description = "The registry ID where the repository was created"
#   value       = module.public_ecr.repository_registry_id
# }

# output "repository_public_url" {
#   description = " The URL of the repository"
#   value       = module.public_ecr.repository_url
# }