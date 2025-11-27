locals {
  # ==================================================================
  # AWS GENERAL
  # ==================================================================
  aws_azs     = slice(data.aws_availability_zones.available.names, 0, local.aws_num_azs)
  aws_num_azs = 3
  region      = "us-east-1"
  environment = "prod"
  # ==================================================================
  # AWS EKS
  # ==================================================================
  aws_eks = {
    cluster_name = "eks-${var.aws_environment}-services"
  }
  # ==================================================================
  # AWS NETWORK
  # ==================================================================
  aws_network = {
    subnet_mask = {
      private  = 4
      public   = 4
      database = 4
      publish  = 3
    }
    subnet_mask_init = {
      private  = 6
      public   = 9
      database = 12
      publish  = 0
    }
    vpc_cidr = var.vpc_cidr
    vpc_name = "vpc-${var.aws_environment}-services"
  }
  tgw_name = "tgw-${var.aws_environment}-services-${local.region}"
  tgw_id   = "tgw-03957c69f0b604dc6"
  vpc_name = "${local.environment}-services"
  all_route_table_ids = flatten([
    module.vpc.database_route_table_ids,
    module.vpc.intra_route_table_ids,
    module.vpc.private_route_table_ids
  ])
}
