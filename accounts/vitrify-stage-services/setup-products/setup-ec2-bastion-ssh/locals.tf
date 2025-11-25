locals {
  aws_environment = "stage"

  labels = {
    cost_allocation_application     = "setup-bastion"
    cost_allocation_business_unit   = "vitrify"
    cost_allocation_project         = "cloud-workloads"
    metadata_cloud_layer            = "workloads"
    metadata_git_url                = "https://gitlab.com/nuageit/delivery/vitrify/cloud-management"
    metadata_terraform_project      = "accounts/vitrify-stage-services/setup-products/setup-ec2-bastion-ssh"
    operational_support_criticality = "medium"
    operational_support_environment = local.aws_environment
    operational_support_team        = "cloud"
  }
}
