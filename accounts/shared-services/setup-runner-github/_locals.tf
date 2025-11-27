# ==================================================================
# GLOBAL LOCALS
# ==================================================================

locals {
  # ==================================================================
  # AWS DEFAULT
  # ==================================================================
  aws_account_id  = "582577266226"
  aws_environment = "prod"
  aws_region      = "us-east-1"
  # ==================================================================
  # github
  # ==================================================================
  github = {
    group_name = "teckSolucoes"
    url        = "https://github.shared.teckSolucoes.tech"
    tls_url    = "tls://github.shared.teckSolucoes.tech:443"
    wildcards = [
      { branches = ["main"], name = "*" }
    ]
  }
  github_wildcards_branches = flatten([
    for repo in local.github.wildcards : [
      for branch in repo.branches : {
        branch = branch
        name   = repo.name
      }
    ]
  ])
  # ==================================================================
  # LABELS
  # ==================================================================
  labels = {
    cost_allocation_application     = "github-aws-oidc"
    cost_allocation_business_unit   = "teckSolucoes"
    cost_allocation_project         = "cloud-integrations"
    metadata_cloud_layer            = "integrations"
    metadata_git_url                = "https://github.com/mkzint/ceat/eduhub/iac/cloud-management" //Ajustar
    metadata_terraform_project      = "accounts/integrations/github-aws-oidc"
    operational_support_criticality = "high"
    operational_support_environment = local.aws_environment
    operational_support_team        = "cloud"
  }
}
