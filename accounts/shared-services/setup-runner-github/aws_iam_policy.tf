# ==================================================================
# MODULE - AWS IAM POLICY - CLOUDFRONT
# ==================================================================

module "iam_policy_github_ci_cloudfront" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "~> 5.54"

  name   = "github-ci-cloudfront-policy"
  policy = file("${path.root}/files/policy/cloudfront.tpl")
}

# ==================================================================
# MODULE - AWS IAM POLICY - CONTAINER
# ==================================================================

module "iam_policy_github_ci_container" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "~> 5.54"

  name   = "github-ci-container-policy"
  policy = file("${path.root}/files/policy/container.tpl")
}

# ==================================================================
# MODULE - AWS IAM POLICY - SERVERLESS
# ==================================================================

module "iam_policy_github_ci_serverless" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "~> 5.54"

  name   = "github-ci-serverless-policy"
  policy = file("${path.root}/files/policy/serverless.tpl")
}
