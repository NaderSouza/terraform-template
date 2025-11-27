# resource "helm_release" "gitlab_runner" {
#   name             = "gitlab-runner"
#   repository       = "https://charts.gitlab.io"
#   chart            = "gitlab-runner"
#   version          = "0.76.0"
#   namespace        = "gitlab-runner"
#   create_namespace = true

#   values = [
#     file("${path.module}/values/gitlab-runner.yaml")
#   ]

#   depends_on = [
#     module.eks
#   ]
# }