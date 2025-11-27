# module "tgw" {
#   source  = "terraform-aws-modules/transit-gateway/aws"
#   version = "~> 2.12"

#   name            = local.tgw_name
#   description     = "${local.tgw_name} shared with other accounts in AWS Organization"
#   amazon_side_asn = 64532

#   create_tgw = false
#   share_tgw  = false

#   enable_default_route_table_association = true
#   enable_default_route_table_propagation = true
#   enable_auto_accept_shared_attachments  = false

#   vpc_attachments = {
#     "vpc-develop-services-${local.region}" = {
#       tgw_id     = local.tgw_id
#       vpc_id     = module.vpc.vpc_id
#       subnet_ids = module.vpc.private_subnets
#       tags = {
#         Name = "attachment-vpc-${local.vpc_name}-${local.region}"
#       }
#     },
#   }
# }
