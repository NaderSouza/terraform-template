# ==================================================================
# MODULE - TRANSIT GATEWAY (TGW)
# ==================================================================
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
  create_tgw_routes                      = false  # Para não criar um route table nova. 

  vpc_attachments = {
    "vpc-network-services-${local.region}" = {
      vpc_id     = module.vpc.vpc_id
      subnet_ids = module.vpc.private_subnets
      # appliance_mode_support = true
      # transit_gateway_default_route_table_association = true
      # transit_gateway_default_route_table_propagation = true
      # tgw_routes = [
      #     {
      #         destination_cidr_block= module.vpc.vpc_cidr_block
      #     },
      #     {
      #         destination_cidr_block= "0.0.0.0/0"
      #     }
      # ]

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

# Adicionando uma rota na tabela de rotas padrão do TGW
resource "aws_ec2_transit_gateway_route" "default_route_internet" {
  transit_gateway_route_table_id = module.tgw.ec2_transit_gateway_association_default_route_table_id # ID da tabela de rotas padrão
  destination_cidr_block         = "0.0.0.0/0"                                                       # Bloco CIDR de destino
  transit_gateway_attachment_id  = module.tgw.ec2_transit_gateway_vpc_attachment_ids[0]              # ID do anexo do TGW (substitua conforme necessário)
  depends_on                     = [module.tgw]
}
