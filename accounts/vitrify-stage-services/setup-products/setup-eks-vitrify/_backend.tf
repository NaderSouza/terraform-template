# ==================================================================
# TERRAFORM REMOTE BACKEND CONFIGURATION
# ==================================================================
terraform {
  backend "s3" {
    bucket         = "484852752690-tf-remote-state"
    dynamodb_table = "484852752690-tf-remote-state-lock"
    encrypt        = true
    key            = "accounts/vitrify-stage-services/setup-eks-vitrify/terraform.tfstate"
    region         = "us-east-1"
  }
}
