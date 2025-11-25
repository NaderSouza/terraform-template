# ==================================================================
# MODULE - VIRTUAL PRIVATE CLOUD (VPC)
# ==================================================================
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = ">= 5.4"

  name                 = local.vpc_name
  cidr                 = local.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  # Setup Subnets Ranges
  azs             = local.azs
  private_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, local.subnet_mask.private, k)]
  public_subnets  = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, local.subnet_mask.public, k + local.subnet_mask_init.public)]

  # Setup Subnets names
  private_subnet_names = [for i in local.azs : "${local.subnet_prefix}-private-${i}"]
  public_subnet_names  = [for i in local.azs : "${local.subnet_prefix}-public-${i}"]

  # NAT Gateway parameters
  enable_nat_gateway     = true
  single_nat_gateway     = false
  one_nat_gateway_per_az = true

  # Internet Gateway parameters
  igw_tags = {
    Name = "igw-${local.environment}-services"
  }

  # Flow Log parameters
  enable_flow_log                           = true
  create_flow_log_cloudwatch_log_group      = true
  create_flow_log_cloudwatch_iam_role       = true
  flow_log_cloudwatch_log_group_name_prefix = "/aws/vpc-flow-log/"
  flow_log_max_aggregation_interval         = 60
}
