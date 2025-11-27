# ==================================================================
# MODULE - AWS SA-EAST-1
# # ==================================================================

# module "sa_east_1" {
#   source = "./sa-east-1"
#   providers = {
#     aws = aws.sa-east-1
#   }

#   aws_environment = local.aws_environment
#   vpc_cidr        = "10.49.48.0/20"
# }

# # ==================================================================
# MODULE - AWS US-EAST-1
# ==================================================================

module "us_east_1" {
  source = "./us-east-1"
  providers = {
    aws = aws.us-east-1
  }

  aws_environment = local.aws_environment
  vpc_cidr        = "10.164.48.0/20"
}
