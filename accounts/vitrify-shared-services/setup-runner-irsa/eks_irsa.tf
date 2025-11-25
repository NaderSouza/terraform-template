# ==================================================================
# MODULE - AWS IAM - EKS IRSA github RUNNER
# ==================================================================
module "github_runner_irsa" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "~> 5.54"

  role_name        = "${local.aws_eks.cluster_name}-irsa-github-runner-role"
  role_description = "EKS IRSA for github Runner in ${local.aws_eks.cluster_name} cluster"
  role_policy_arns = {
    "eks-irsa-github-runner-policy" = module.eks_policy_github_runner.arn
  }
  oidc_providers = {
    main = {
      provider_arn               = local.aws_eks.oidc_provider_arn
      namespace_service_accounts = ["github-runner:github-runner"]
    }
  }
}

# ==================================================================
# MODULE - AWS IAM - EKS IRSA FOR SECRET STORE CSI DRIVE
# ==================================================================

# module "secrets_store_csi_irsa" {
#   source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
#   version = "~> 5.54"

#   role_name        = "${local.aws_eks.cluster_name}-irsa-secrets-store-csi-access"
#   role_description = "EKS IRSA for Secret Store CSI Drive in ${local.aws_eks.cluster_name} cluster"
#   role_policy_arns = {
#     "eks-irsa-secrets-store-csi-policy" = module.eks_policy_secrets_store_csi_policy.arn
#   }
#   oidc_providers = {
#     main = {
#       provider_arn               = local.aws_eks.oidc_provider_arn
#       # namespace_service_accounts = local.secret_csi_namespace_serviceaccounts
#     }
#   }
# }
