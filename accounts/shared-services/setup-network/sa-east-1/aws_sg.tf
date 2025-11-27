# # ==================================================================
# # MODULE AWS SG - GLOBAL NETWORK
# # ==================================================================

# module "sg_global_network" {
#   source  = "terraform-aws-modules/security-group/aws"
#   version = "~> 5.1"

#   name        = "sg_global_network"
#   description = "Allow Global Network traffic"
#   vpc_id      = module.vpc.vpc_id
#   ingress_with_cidr_blocks = [
#     {
#       description = "Global Network from VPC"
#       from_port   = 0
#       to_port     = 0
#       protocol    = "-1"
#       cidr_blocks = module.vpc.vpc_cidr_block
#     },
#   ]
#   tags = {
#     Name = "sg-global-network"
#   }
# }

# # ==================================================================
# # MODULE AWS SG - VPC TLS
# # ==================================================================

# module "sg_vpc_tls" {
#   source  = "terraform-aws-modules/security-group/aws"
#   version = "~> 5.1"

#   name        = "sg_vpc_tls"
#   description = "Allow TLS inbound traffic - for VPC endpoints"
#   vpc_id      = module.vpc.vpc_id
#   ingress_with_cidr_blocks = [
#     {
#       description = "TLS from VPC"
#       from_port   = 443
#       to_port     = 443
#       protocol    = "tcp"
#       cidr_blocks = module.vpc.vpc_cidr_block
#     },
#   ]
#   egress_cidr_blocks = ["0.0.0.0/0"]
#   egress_rules       = ["https-443-tcp"]
#   tags = {
#     Name = "sg-vpc-tls"
#   }
# }
