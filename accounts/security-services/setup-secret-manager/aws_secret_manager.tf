# ==================================================================
# AWS SECRET MANAGER - DATABASE SECRET
# ==================================================================
resource "aws_secretsmanager_secret" "db_secret" {
  name        = local.secret_name
  description = "Secret for database credentials"

  tags = local.aws_default_tags
}
