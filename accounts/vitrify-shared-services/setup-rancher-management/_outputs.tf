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
# OUTPUTS - RANCHER
# ==================================================================

output "rancher_cluster_id" {
  description = "Rancher Cluster ID"
  value       = rancher2_cluster.this.id
}

output "rancher_project_devops_id" {
  description = "Rancher Project DevOps ID"
  value       = rancher2_project.devops.id
}

output "rancher_project_id" {
  description = "Rancher Project ID"
  value       = rancher2_project.client.id
}

output "rancher_project_gitops_id" {
  description = "Rancher Project GitOps ID"
  value       = rancher2_project.gitops.id
}

output "rancher_project_monitoring_id" {
  description = "Rancher Project Monitoring ID"
  value       = rancher2_project.monitoring.id
}

output "rancher_project_observability_id" {
  description = "Rancher Project Observability ID"
  value       = rancher2_project.observability.id
}
