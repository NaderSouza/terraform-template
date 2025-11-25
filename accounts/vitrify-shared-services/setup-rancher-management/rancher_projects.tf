# ==================================================================
# RANCHER PROJECTS
# ==================================================================

resource "rancher2_project" "devops" {
  provider         = rancher2.admin
  name             = "DevOps"
  cluster_id       = rancher2_cluster.this.id
  wait_for_cluster = true
  depends_on = [
    kubectl_manifest.rancher_add_cluster
  ]
}

resource "rancher2_project" "client" {
  provider         = rancher2.admin
  name             = "Project Vitrify"
  cluster_id       = rancher2_cluster.this.id
  wait_for_cluster = true
  depends_on = [
    kubectl_manifest.rancher_add_cluster
  ]
}

resource "rancher2_project" "gitops" {
  provider         = rancher2.admin
  name             = "GitOps"
  cluster_id       = rancher2_cluster.this.id
  wait_for_cluster = true
  depends_on = [
    kubectl_manifest.rancher_add_cluster
  ]
}

resource "rancher2_project" "monitoring" {
  provider         = rancher2.admin
  name             = "Monitoring"
  cluster_id       = rancher2_cluster.this.id
  wait_for_cluster = true
  depends_on = [
    kubectl_manifest.rancher_add_cluster
  ]
}

resource "rancher2_project" "observability" {
  provider         = rancher2.admin
  name             = "Observability"
  cluster_id       = rancher2_cluster.this.id
  wait_for_cluster = true
  depends_on = [
    kubectl_manifest.rancher_add_cluster
  ]
}
