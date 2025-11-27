# ==================================================================
# MODULE AWS VPC
# ==================================================================

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.5"

  name                 = local.aws_network.vpc_name
  cidr                 = local.aws_network.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  # Setup Subnets Ranges
  azs              = local.aws_azs
  database_subnets = [for k, v in local.aws_azs : cidrsubnet(local.aws_network.vpc_cidr, local.aws_network.subnet_mask.database, k + local.aws_network.subnet_mask_init.database)]
  intra_subnets    = [for k, v in local.aws_azs : cidrsubnet(local.aws_network.vpc_cidr, local.aws_network.subnet_mask.publish, k + local.aws_network.subnet_mask_init.publish)]
  private_subnets  = [for k, v in local.aws_azs : cidrsubnet(local.aws_network.vpc_cidr, local.aws_network.subnet_mask.private, k + local.aws_network.subnet_mask_init.private)]
  public_subnets   = [for k, v in local.aws_azs : cidrsubnet(local.aws_network.vpc_cidr, local.aws_network.subnet_mask.public, k + local.aws_network.subnet_mask_init.public)]

  # Setup Subnets names
  database_subnet_names = [for i in local.aws_azs : "subnet-${var.aws_environment}-services-database-${i}"]
  intra_subnet_names    = [for i in local.aws_azs : "subnet-${var.aws_environment}-services-publish-${i}"]
  private_subnet_names  = [for i in local.aws_azs : "subnet-${var.aws_environment}-services-private-${i}"]
  public_subnet_names   = [for i in local.aws_azs : "subnet-${var.aws_environment}-services-public-${i}"]

  # NAT Gateway parameters
  enable_nat_gateway     = false
  single_nat_gateway     = false
  one_nat_gateway_per_az = false

  # Internet Gateway parameters
  igw_tags = {
    Name = "igw-${var.aws_environment}-services"
  }

  # Database subnet parameters
  create_database_subnet_route_table = true
  database_subnet_group_name         = "subnet-group-database"
  database_subnet_suffix             = "database"
  database_route_table_tags = {
    Name = "rt-${var.aws_environment}-services-database"
  }

  # Intra subnet parameters
  intra_route_table_tags = {
    Name = "rt-${var.aws_environment}-services-publish"
  }
  intra_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
    "karpenter.sh/discovery"          = local.aws_eks.cluster_name
  }

  # Private subnet parameters
  private_route_table_tags = {
    Name = "rt-${var.aws_environment}-services-private"
  }

  # Public subnet parameters
  public_route_table_tags = {
    Name = "rt-${var.aws_environment}-services-public"
  }
  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }

  # Default Route
  manage_default_route_table = true

  # Flow Log parameters
  enable_flow_log                           = false
  create_flow_log_cloudwatch_log_group      = false
  create_flow_log_cloudwatch_iam_role       = false
  flow_log_cloudwatch_log_group_name_prefix = "/aws/vpc-flow-log/"
  flow_log_max_aggregation_interval         = 60
  flow_log_destination_type                 = "cloud-watch-logs"
}
