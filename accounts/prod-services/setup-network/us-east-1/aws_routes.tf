# resource "aws_route" "route_private" {
#   count                  = length(local.all_route_table_ids)
#   route_table_id         = local.all_route_table_ids[count.index]
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id             = local.tgw_id
#   depends_on             = [module.tgw]
# }

# resource "aws_route" "route_sa" {
#   count                  = length(local.all_route_table_ids)
#   route_table_id         = local.all_route_table_ids[count.index]
#   destination_cidr_block = "10.49.0.0/16"
#   gateway_id             = local.tgw_id
#   depends_on             = [module.tgw]
# }

# # resource "aws_route" "route_us" {
# #   count                  = length(local.all_route_table_ids)
# #   route_table_id         = local.all_route_table_ids[count.index]
# #   destination_cidr_block = "10.50.0.0/16"
# #   gateway_id             = local.tgw_id
# #   depends_on             = [module.tgw]
# # }
