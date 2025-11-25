# ==================================================================
# TGW - TABLE ROUTE 
# ==================================================================
# resource "aws_route" "route_sa" {
#   count                  = length(local.all_route_table_ids)
#   route_table_id         = local.all_route_table_ids[count.index]
#   destination_cidr_block = "10.49.0.0/16"
#   gateway_id             = module.tgw.ec2_transit_gateway_id
#   depends_on             = [module.vpc]
# }

resource "aws_route" "route_us" {
  count                  = length(local.all_route_table_ids)
  route_table_id         = local.all_route_table_ids[count.index]
  destination_cidr_block = "10.164.0.0/16"
  gateway_id             = module.tgw.ec2_transit_gateway_id
  depends_on             = [module.vpc]
}
