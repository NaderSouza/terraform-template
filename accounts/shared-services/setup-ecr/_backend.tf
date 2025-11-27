# ==================================================================
# TERRAFORM REMOTE BACKEND CONFIGURATION
# ==================================================================

terraform {
  backend "s3" {
    bucket         = "157489942873-tf-remote-state"
    dynamodb_table = "157489942873-tf-remote-state-lock"
    encrypt        = true
    key            = "accounts/stage-services/setup-ecr/terraform.tfstate"
    region         = "us-east-1"
  }
}
