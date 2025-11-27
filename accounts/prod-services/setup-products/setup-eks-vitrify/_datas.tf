# ==================================================================
# DATAS - AWS
# ==================================================================

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_ecrpublic_authorization_token" "token" {
  provider = aws.us-east-1
}

data "aws_iam_roles" "sso_admin" {
  name_regex  = "AWSReservedSSO_AWSAdministratorAccess_*"
  path_prefix = "/aws-reserved/sso.amazonaws.com/"
}

# ==================================================================
# DATAS - AWS NETWORK
# ==================================================================

data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["vpc-${local.aws_environment}-services"]
  }
}

data "aws_subnets" "publish" {
  filter {
    name = "tag:Name"
    values = [
      "subnet-${local.aws_environment}-services-publish-${local.aws_region}a",
      "subnet-${local.aws_environment}-services-publish-${local.aws_region}b",
      "subnet-${local.aws_environment}-services-publish-${local.aws_region}c"
    ]
  }
}

data "aws_subnets" "public" {
  filter {
    name = "tag:Name"
    values = [
      "subnet-${local.aws_environment}-services-public-${local.aws_region}a",
      "subnet-${local.aws_environment}-services-public-${local.aws_region}b",
      "subnet-${local.aws_environment}-services-public-${local.aws_region}c"
    ]
  }
}

# ==================================================================
# DATAS - AWS ROUTE53
# ==================================================================

data "aws_route53_zone" "public_zone" {
  name         = "teckSolucoes.tech"
  private_zone = false
}

data "aws_route53_zone" "private_zone" {
  name         = "teckSolucoes.tech"
  private_zone = true
}


# ==================================================================
# DATAS - AWS ACMS
# ==================================================================

data "aws_acm_certificate" "client" {
  domain      = "teckSolucoes.tech"
  types       = ["AMAZON_ISSUED"]
  key_types   = ["RSA_2048", "RSA_4096"]
  most_recent = true
}

# ==================================================================
# DATAS - AWS ALB
# ==================================================================

data "aws_lb" "this" {
  tags = {
    "ingress.k8s.aws/resource" = "LoadBalancer"
    "ingress.k8s.aws/stack"    = "ingress-nginx/forwarding-ingress-nginx"
    "elbv2.k8s.aws/cluster"    = module.eks.cluster_name
  }
  depends_on = [
    kubernetes_ingress_v1.ingress_forwarding
  ]
}
