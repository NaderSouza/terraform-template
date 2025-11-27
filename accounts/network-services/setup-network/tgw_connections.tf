# ==================================================================
# TGW - CROSS REGION ROUTES
# ==================================================================
# resource "aws_ec2_transit_gateway_peering_attachment" "cross_region" {
#   provider                = aws.us-east-1
#   transit_gateway_id      = module.us_east_1.tgw_id
#   peer_transit_gateway_id = module.sa_east_1.tgw_id
#   peer_region             = "sa-east-1"
#   tags = {
#     Name = "attachment-peering-network-services-cross-region"
#   }
# }

# resource "aws_ec2_transit_gateway_peering_attachment_accepter" "cross_region" {
#   provider                      = aws.sa-east-1
#   transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.cross_region.id
#   tags = {
#     Name = "attachment-peering-network-services-cross-region-accepter"
#   }
# }

# resource "aws_ec2_transit_gateway_route" "cross_region_route_sa" {
#   provider                       = aws.sa-east-1
#   destination_cidr_block         = local.peering_cidr_us
#   transit_gateway_route_table_id = module.sa_east_1.tgw_troute_tabe_id
#   transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.cross_region.id
# }

# resource "aws_ec2_transit_gateway_route" "cross_region_route_us" {
#   provider                       = aws.us-east-1
#   destination_cidr_block         = local.peering_cidr_sa
#   transit_gateway_route_table_id = module.us_east_1.tgw_troute_tabe_id
#   transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.cross_region.id
# }

