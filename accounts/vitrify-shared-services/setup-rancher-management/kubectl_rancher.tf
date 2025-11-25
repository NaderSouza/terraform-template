# ==================================================================
# KUBERNETES MANIFEST - RANCHER ADD CLUSTER
# ==================================================================

resource "kubectl_manifest" "rancher_add_cluster" {
  count     = 9
  yaml_body = local.cattle_list[count.index]
  depends_on = [
    rancher2_cluster.this
  ]
  lifecycle {
    ignore_changes = all
  }
}
