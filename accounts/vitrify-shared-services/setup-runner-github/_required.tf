# ==================================================================
# TERRAFORM REQUIRED CONFIGURATION
# ==================================================================

terraform {
  required_version = ">= 1.6.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.96"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}
