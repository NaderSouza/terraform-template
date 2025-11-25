# # ==================================================================
# # KUBECTL MANIFEST - ESO CLUSTER SECRETSTORE
# # ==================================================================

# resource "kubectl_manifest" "eso_cluster_secretstore" {
#   yaml_body  = <<YAML
#     apiVersion: external-secrets.io/v1beta1
#     kind: ClusterSecretStore
#     metadata:
#       name: aws-secrets-accessor
#     spec:
#       provider:
#         aws:
#           service: SecretsManager
#           region: ${local.aws_region}
#           auth:
#             jwt:
#               serviceAccountRef:
#                 name: external-secrets-sa
#                 namespace: external-secrets
#   YAML
#   depends_on = [module.eks_addons.external_secrets]
# }
