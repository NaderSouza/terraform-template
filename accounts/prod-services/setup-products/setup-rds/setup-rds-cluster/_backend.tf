# ==================================================================
# TERRAFORM REMOTE BACKEND CONFIGURATION
# ==================================================================
terraform {
  backend "s3" {
    bucket         = "582577266226-tf-remote-state"
    dynamodb_table = "582577266226-tf-remote-state-lock"
    encrypt        = true
    key            = "accounts/prod-services/setup-products/setup-rds-cluster/terraform.tfstate"
    region         = "us-east-1"
  }
}
