# ==================================================================
# PROVIDER AWS - DEFAULT
# ==================================================================
provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}


provider "aws" {
  region = local.aws_region
  default_tags {
    tags = local.labels
  }
}

# ==================================================================
# PROVIDER - OTHERS
# ==================================================================

provider "tls" {}
