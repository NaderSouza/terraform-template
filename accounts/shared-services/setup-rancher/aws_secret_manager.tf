# ==================================================================
# RANDOM - RANCHER ADMIN PASSWORD
# ==================================================================

resource "random_password" "rancher_admin" {
  length           = 28
  special          = true
  override_special = "(_="
}

# ==================================================================
# MODULE AWS SECRETS MANAGER - RANCHER
# ==================================================================

module "secrets_manager_rancher" {
  source  = "terraform-aws-modules/secrets-manager/aws"
  version = "~> 1.1"

  name                    = "/tools/plataform/${local.rancher_instance.name}"
  description             = "Information about Rancher login"
  recovery_window_in_days = 7
  block_public_policy     = true
  secret_string = jsonencode({
    RANCHER_ADMIN_PASSWORD = random_password.rancher_admin.result
    RANCHER_URL            = local.rancher_instance.server_url
  })
}
