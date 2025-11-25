# ==================================================================
# PROVIDER - AWS DEFAULT
# ==================================================================

provider "aws" {
  region = local.aws_region
  default_tags {
    tags = {
      "automation:managedby"          = "terraform",
      "cost-allocation:business-unit" = local.aws_default_tags.cost_allocation_business_unit,
      "cost-allocation:product"       = local.aws_default_tags.cost_allocation_product,
      "operation-support:account"     = local.aws_default_tags.operation_support_account_name,
      "operation-support:criticality" = local.aws_default_tags.operation_support_criticality
      "operation-support:environment" = local.aws_default_tags.operation_support_environment,
      "operation-support:team"        = local.aws_default_tags.operation_support_team,
      "source-code"                   = local.aws_default_tags.source_code
      "source-project"                = local.aws_default_tags.source_project
    }
  }
}

# ==================================================================
# PROVIDER - AWS SA-EAST-1
# ==================================================================

# provider "aws" {
#   region = "sa-east-1"
#   alias  = "sa-east-1"
#   default_tags {
#     tags = {
#       "automation:managedby"          = "terraform",
#       "cost-allocation:business-unit" = local.aws_default_tags.cost_allocation_business_unit,
#       "cost-allocation:product"       = local.aws_default_tags.cost_allocation_product,
#       "operation-support:account"     = local.aws_default_tags.operation_suport_account_name,
#       "operation-support:criticality" = local.aws_default_tags.operation_support_criticality
#       "operation-support:environment" = local.aws_default_tags.operation_support_environment,
#       "operation-support:team"        = local.aws_default_tags.operation_support_team,
#       "source-code"                   = local.aws_default_tags.source_code
#       "source-project"                = local.aws_default_tags.source_project
#     }
#   }
# }

# ==================================================================
# PROVIDER - AWS US-EAST-1
# ==================================================================

provider "aws" {
  region = "us-east-1"
  alias  = "us-east-1"
  default_tags {
    tags = {
      "automation:managedby"          = "terraform",
      "cost-allocation:business-unit" = local.aws_default_tags.cost_allocation_business_unit,
      "cost-allocation:product"       = local.aws_default_tags.cost_allocation_product,
      "operation-support:account"     = local.aws_default_tags.operation_suport_account_name,
      "operation-support:criticality" = local.aws_default_tags.operation_support_criticality
      "operation-support:environment" = local.aws_default_tags.operation_support_environment,
      "operation-support:team"        = local.aws_default_tags.operation_support_team,
      "source-code"                   = local.aws_default_tags.source_code
      "source-project"                = local.aws_default_tags.source_project
    }
  }
}

# ==================================================================
# PROVIDER - KUBECTL
# ==================================================================

provider "kubectl" {
  host                   = data.aws_eks_cluster.selected.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.selected.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.selected.token
}

# ==================================================================
# PROVIDER - KUBERNETES
# ==================================================================

provider "kubernetes" {
  host                   = data.aws_eks_cluster.selected.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.selected.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.selected.token
}

# ==================================================================
# PROVIDER - RANCHER
# ==================================================================

provider "rancher2" {
  api_url   = local.rancher_instance.server_url
  bootstrap = true
}

resource "rancher2_bootstrap" "admin" {
  initial_password = local.rancher_instance.admin_password
  password         = local.rancher_instance.admin_password
  # telemetry        = true
}

provider "rancher2" {
  alias     = "admin"
  api_url   = rancher2_bootstrap.admin.url
  token_key = rancher2_bootstrap.admin.token
  insecure  = true
}

# ==================================================================
# PROVIDER - OTHERS
# ==================================================================

provider "http" {}
