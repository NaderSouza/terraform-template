# ==================================================================
# LOCALS
# ==================================================================
locals {
  azs = slice(data.aws_availability_zones.available.names, 0, local.num_azs)
  all_route_table_ids = flatten([
    module.vpc.private_route_table_ids,
    module.vpc.public_route_table_ids
  ])
  account_name    = "${local.client_name}-${local.environment}-services"
  client_name     = "teckSolucoes"
  environment     = "network"
  master_account  = "125832268877"
  num_azs         = 3
  organization_id = "o-jb8xq9gah5"
  region          = "sa-east-1"
  subnet_prefix   = "subnet-${local.vpc_name}"
  subnet_mask = {
    private = 4
    public  = 4
  }
  subnet_mask_init = {
    public = 3
  }
  tgw_name = "tgw-${local.vpc_name}-${local.region}"
  vpc_cidr = "10.50.0.0/20"
  vpc_name = "${local.environment}-services"
  # Bastion
  bastion_name = "bastion-${local.vpc_name}-${local.region}"
}
