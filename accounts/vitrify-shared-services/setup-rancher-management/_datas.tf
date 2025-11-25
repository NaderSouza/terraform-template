# ==================================================================
# DATAS - AWS
# ==================================================================

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

# ==================================================================
# DATA - AWS EKS
# ==================================================================

data "aws_eks_cluster" "selected" {
  name = local.aws_eks.cluster_name
}

data "aws_eks_cluster_auth" "selected" {
  name = local.aws_eks.cluster_name
}

# ==================================================================
# DATA - AWS SECRET MANAGER
# ==================================================================

data "aws_secretsmanager_secret" "rancher" {
  name = "/tools/plataform/rancher-${local.aws_environment}-services"
}

data "aws_secretsmanager_secret_version" "rancher" {
  secret_id = data.aws_secretsmanager_secret.rancher.id
}

# ==================================================================
# DATA - HTTP
# ==================================================================

data "http" "yaml_rancher_add_cluster" {
  url = rancher2_cluster.this.cluster_registration_token[0].manifest_url
}
