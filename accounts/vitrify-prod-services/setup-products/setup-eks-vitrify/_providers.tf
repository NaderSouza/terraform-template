# ==================================================================
# PROVIDER AWS - US-EAST-1
# ==================================================================

provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
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
    }
  }
}

# ==================================================================
# PROVIDER AWS - SA-EAST-1
# ==================================================================

# provider "aws" {
#   region = local.aws_region
#   default_tags {
#     tags = {
#       "automation:managedby"          = "terraform",
#       "cost-allocation:business-unit" = local.aws_default_tags.cost_allocation_business_unit,
#       "cost-allocation:product"       = local.aws_default_tags.cost_allocation_product,
#       "operation-support:account"     = local.aws_default_tags.operation_support_account_name,
#       "operation-support:criticality" = local.aws_default_tags.operation_support_criticality
#       "operation-support:environment" = local.aws_default_tags.operation_support_environment,
#       "operation-support:team"        = local.aws_default_tags.operation_support_team,
#       "source-code"                   = local.aws_default_tags.source_code
#     }
#   }
# }

# ==================================================================
# PROVIDER - HELM
# ==================================================================

provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args        = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
    }
  }
}

# ==================================================================
# PROVIDER - KUBECTL
# ==================================================================

provider "kubectl" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args        = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
  }
}

# ==================================================================
# PROVIDER - KUBERNETES
# ==================================================================

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args        = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
  }
}
