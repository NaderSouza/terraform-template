# ==================================================================
# TERRAFORM - MAIN MODULES
# ==================================================================
# module "sa_east_1" {
#   source = "./sa-east-1"
#   providers = {
#     aws = aws.sa-east-1
#   }
# }

module "us_east_1" {
  source = "./us-east-1"
  providers = {
    aws = aws.us-east-1
  }
}
