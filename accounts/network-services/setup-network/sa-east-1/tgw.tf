# ==============================================================================
# MODULE - TRANSIT GATEWAY (TGW)
# ==============================================================================
module "tgw" {
  source  = "terraform-aws-modules/transit-gateway/aws"
  version = "~> 2.0"

  name            = local.tgw_name
  description     = "${local.tgw_name} shared with other accounts in AWS Organization"
  amazon_side_asn = 64532

  create_tgw = true
  share_tgw  = true

  enable_default_route_table_association = true
  enable_default_route_table_propagation = true
  enable_auto_accept_shared_attachments  = true

  vpc_attachments = {
    "vpc-network-services-${local.region}" = {
      vpc_id                 = module.vpc.vpc_id
      subnet_ids             = module.vpc.private_subnets
      appliance_mode_support = true
      tgw_routes = [
        {
          destination_cidr_block = module.vpc.vpc_cidr_block
        },
        {
          destination_cidr_block = "0.0.0.0/0"
        }
      ]

      tags = {
        Name = "attachment-vpc-${local.vpc_name}-${local.region}"
      }
    },
  }

  ram_allow_external_principals = true
  ram_principals                = ["arn:aws:organizations::${local.master_account}:organization/${local.organization_id}"]

  tags = {
    Name = local.tgw_name
  }
}
