# ==================================================================
# MODULE - AWS IAM - EKS IRSA github RUNNER POLICY
# ==================================================================
module "eks_policy_github_runner" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "~> 5.54"

  name        = "${local.aws_eks.cluster_name}-irsa-github-runner-policy"
  description = "Policy for allowing S3 operations for github Runner cache in ${local.aws_eks.cluster_name} cluster"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:ListBucket"
        ],
        "Resource" : [
          "arn:aws:s3:::${module.github_runner_cache_s3_bucket.s3_bucket_id}",
          "arn:aws:s3:::${module.github_runner_cache_s3_bucket.s3_bucket_id}/*"
        ]
      }
    ]
  })
}


# ==================================================================
# MODULE - AWS IAM - EKS IRSA SECRETS STORE CSI POLICY
# ==================================================================
module "eks_policy_secrets_store_csi_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "~> 5.54"

  name        = "${local.aws_eks.cluster_name}-irsa-secret-csi-policy"
  description = "Policy for allowing Secrets Manager, S3, SQS read and send for ${local.aws_eks.cluster_name} cluster"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "SecretsManagerAccess",
        "Effect" : "Allow",
        "Action" : [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret"
        ],
        "Resource" : [
          "arn:aws:secretsmanager:${local.aws_region}:${local.aws_account_id}:secret:*"
        ]
      },
      {
        "Sid" : "S3Access",
        "Effect" : "Allow",
        "Action" : [
          "s3:GetObject",
          "s3:PutObject"
        ],
        "Resource" : [
          "arn:aws:s3:::*",
          "arn:aws:s3:::*/*"
        ]
      },
      {
        "Sid" : "SQSReadAccess",
        "Effect" : "Allow",
        "Action" : [
          "sqs:ReceiveMessage",
          "sqs:GetQueueAttributes",
          "sqs:GetQueueUrl",
          "sqs:ListQueues"
        ],
        "Resource" : "arn:aws:sqs:${local.aws_region}:${local.aws_account_id}:*"
      },
      {
        "Sid" : "SQSSendAccess",
        "Effect" : "Allow",
        "Action" : [
          "sqs:SendMessage"
        ],
        "Resource" : "arn:aws:sqs:${local.aws_region}:${local.aws_account_id}:*"
      }
    ]
  })
}
