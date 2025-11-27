# ==================================================================
# MODULE - AWS IAM - github OIDC CLOUDFRONT ROLE
# ==================================================================

module "iam_github_oidc_cloudfront_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version = "~> 5.54"

  create_role          = true
  role_name            = "github-ci-cloudfront-role"
  max_session_duration = 3600
  provider_urls = [
    local.github.url
  ]
  oidc_subjects_with_wildcards = [
    for repo in local.github_wildcards_branches :
    format("project_path:%s/%s:ref_type:branch:ref:%s", local.github.group_name, repo.name, repo.branch)
  ]
  role_policy_arns = [
    module.iam_policy_github_ci_cloudfront.arn

  ]
}

# ==================================================================
# MODULE - AWS IAM - github OIDC CONTAINER ROLE
# ==================================================================

module "iam_github_oidc_container_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version = "~> 5.54"

  create_role          = true
  role_name            = "github-ci-container-role"
  max_session_duration = 3600
  provider_urls = [
    local.github.url
  ]
  oidc_subjects_with_wildcards = [
    for repo in local.github_wildcards_branches :
    format("project_path:%s/%s:ref_type:branch:ref:%s", local.github.group_name, repo.name, repo.branch)
  ]
  role_policy_arns = [
    module.iam_policy_github_ci_container.arn
  ]
}

# ==================================================================
# MODULE - AWS IAM - github OIDC SERVERLESS ROLE
# ==================================================================

module "iam_github_oidc_serverless_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version = "~> 5.54"

  create_role          = true
  role_name            = "github-ci-serverless-role"
  max_session_duration = 3600
  provider_urls = [
    local.github.url
  ]
  oidc_subjects_with_wildcards = [
    for repo in local.github_wildcards_branches :
    format("project_path:%s/%s:ref_type:branch:ref:%s", local.github.group_name, repo.name, repo.branch)
  ]
  role_policy_arns = [
    module.iam_policy_github_ci_serverless.arn
  ]
}
