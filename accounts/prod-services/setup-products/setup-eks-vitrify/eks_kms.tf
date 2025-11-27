# ==================================================================
# MODULE AWS KMS - EKS
# ==================================================================

module "kms" {
  source  = "terraform-aws-modules/kms/aws"
  version = "~> 3.0"

  description             = "Setup KMS ${local.aws_eks.cluster_name} cluster encryption key"
  deletion_window_in_days = 7
  enable_key_rotation     = true
  enable_default_policy   = false
  key_administrators = [
    module.eks.cluster_iam_role_arn,
    "arn:aws:iam::${local.aws_account_id}:role/aws-reserved/sso.amazonaws.com/${local.aws_sso_role}"
    # "arn:aws:iam::${local.aws_account_id}:user/${local.aws_username}"
  ]
  key_users = [
    module.eks.cluster_iam_role_arn
  ]
  aliases = ["eks/${local.aws_eks.cluster_name}-encryption-key"]

}
