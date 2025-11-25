
# ==================================================================
# TERRAFORM REMOTE BACKEND CONFIGURATION
# ==================================================================
terraform {
  backend "s3" {
    bucket         = "499897076270-tf-remote-state"
    dynamodb_table = "499897076270-tf-remote-state-lock"
    encrypt        = true
    key            = "accounts/vitrify-security-services/setup-waf/terraform.tfstate"
    region         = "us-east-1"
  }
}
