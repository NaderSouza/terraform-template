# ==================================================================
# RESOURCE - AWS IAM OPENID CONNECT PROVIDER - github
# ==================================================================

resource "aws_iam_openid_connect_provider" "github" {
  client_id_list  = [local.github.url]
  thumbprint_list = [data.tls_certificate.github.certificates[0].sha1_fingerprint]
  url             = local.github.url
}
