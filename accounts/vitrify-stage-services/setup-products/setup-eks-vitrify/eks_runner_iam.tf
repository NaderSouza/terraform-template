# # Política personalizada para o GitLab Runner (ECR e S3)
# resource "aws_iam_policy" "gitlab_runner_policy" {
#   name        = "gitlab_runner_policy"
#   description = "Política para o GitLab Runner rodando nos nós do EKS"
#   policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       # Permissões para KMS
#       {
#         Effect = "Allow",
#         Action = [
#           "kms:CreateKey",
#           "kms:DescribeKey",
#           "kms:CreateAlias",
#           "kms:Encrypt",
#           "kms:Decrypt",
#           "kms:GenerateDataKey",
#           "kms:ListAliases",
#           "kms:ListKeys",
#           "kms:GetPublicKey",
#           "kms:Sign"
#         ],
#         Resource = "*"
#       },
#       # Permissões para ECR
#       {
#         Effect = "Allow",
#         Action = [
#           "ecr:BatchCheckLayerAvailability",
#           "ecr:GetDownloadUrlForLayer",
#           "ecr:BatchGetImage",
#           "ecr:PutImage",
#           "ecr:InitiateLayerUpload",
#           "ecr:UploadLayerPart",
#           "ecr:CompleteLayerUpload"
#         ],
#         Resource = "*"
#       },
#       # Permissões para S3
#       {
#         Effect = "Allow",
#         Action = [
#           "s3:ListBucket",
#           "s3:GetObject",
#           "s3:PutObject"
#         ],
#         Resource = "*"
#       },
#       # Permissões para interagir com o EKS
#       {
#         Effect = "Allow",
#         Action = [
#           "eks:DescribeCluster",
#           "eks:ListClusters",
#           "eks:ListNodegroups",
#           "eks:DescribeNodegroup"
#         ],
#         Resource = "*"
#       },
#       # Permissões para CloudWatch Logs (útil para logs de execução)
#       {
#         Effect = "Allow",
#         Action = [
#           "logs:CreateLogGroup",
#           "logs:CreateLogStream",
#           "logs:PutLogEvents",
#           "logs:DescribeLogStreams"
#         ],
#         Resource = "*"
#       },
#       # Permissões para executar pods no Kubernetes via EKS
#       {
#         Effect = "Allow",
#         Action = [
#           "ec2:DescribeInstances",
#           "ec2:DescribeNetworkInterfaces",
#           "ec2:CreateNetworkInterface",
#           "ec2:DeleteNetworkInterface",
#           "ec2:DescribeSubnets",
#           "ec2:DescribeSecurityGroups"
#         ],
#         Resource = "*"
#       }
#     ]
#   })
# }

# # Anexar a política personalizada à role existente dos nós do EKS
# resource "aws_iam_role_policy_attachment" "attach_runner_policy_to_eks" {
#   role = "eks-green-worknodes-eks-node-group-20250502145545233500000004"
#   policy_arn = aws_iam_policy.gitlab_runner_policy.arn
# }
