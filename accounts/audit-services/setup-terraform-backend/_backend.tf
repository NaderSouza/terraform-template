# ==================================================================
# TERRAFORM REMOTE BACKEND CONFIGURATION
# ==================================================================
terraform {
  backend "s3" {
    bucket         = "325538745824-tf-remote-state"
    dynamodb_table = "325538745824-tf-remote-state-lock"
    encrypt        = true
    key            = "accounts/shared-services/setup-terraform-backend/terraform.tfstate"
    region         = "us-east-1"
  }
}
