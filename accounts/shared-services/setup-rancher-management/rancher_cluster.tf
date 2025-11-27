# ==================================================================
# RANCHER CLUSTER
# ==================================================================

resource "rancher2_cluster" "this" {
  provider    = rancher2.admin
  name        = local.aws_eks.cluster_name
  description = local.aws_eks.cluster_description
  lifecycle {
    ignore_changes = all
  }
}
