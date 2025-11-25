# module "vpc_endpoints" {
#   source  = "terraform-aws-modules/vpc/aws//modules/vpc-endpoints"
#   version = "~> 5.5"

#   vpc_id                     = module.vpc.vpc_id
#   create_security_group      = true
#   security_group_name        = "vpc-endpoints-${local.aws_network.vpc_name}"
#   security_group_description = "VPC endpoint SG to ${local.aws_network.vpc_name}"
#   security_group_rules = {
#     ingress_https = {
#       description = "HTTPS from VPC"
#       cidr_blocks = [module.vpc.vpc_cidr_block]
#     }
#   }

#   endpoints = {
#     ecr_dkr = {
#       service             = "ecr.dkr"
#       service_type        = "Interface"
#       private_dns_enabled = true
#       subnet_ids          = module.vpc.private_subnets
#       security_group_ids  = [module.sg_vpc_tls.security_group_id]
#       tags                = { Name = "ecr-dkr-vpc-endpoint" }
#     },
#     ecr_api = {
#       service             = "ecr.api"
#       service_type        = "Interface"
#       private_dns_enabled = true
#       subnet_ids          = module.vpc.private_subnets
#       security_group_ids  = [module.sg_vpc_tls.security_group_id]
#       tags                = { Name = "ecr-api-vpc-endpoint" }
#     },
#     ec2 = {
#       service             = "ec2"
#       service_type        = "Interface"
#       private_dns_enabled = true
#       subnet_ids          = module.vpc.private_subnets
#       security_group_ids  = [module.sg_vpc_tls.security_group_id]
#       tags                = { Name = "ec2-endpoint" }
#     },
#     ec2messages = {
#       service             = "ec2messages"
#       service_type        = "Interface"
#       private_dns_enabled = true
#       subnet_ids          = module.vpc.private_subnets
#       security_group_ids  = [module.sg_vpc_tls.security_group_id]
#       tags                = { Name = "ec2-messages-endpoint" }
#     },
#     elasticloadbalancing = {
#       service             = "elasticloadbalancing"
#       service_type        = "Interface"
#       private_dns_enabled = true
#       subnet_ids          = module.vpc.private_subnets
#       security_group_ids  = [module.sg_vpc_tls.security_group_id]
#       tags                = { Name = "elasticloadbalancing-endpoint" }
#     },
#     kms = {
#       service             = "kms"
#       service_type        = "Interface"
#       private_dns_enabled = true
#       subnet_ids          = module.vpc.private_subnets
#       security_group_ids  = [module.sg_vpc_tls.security_group_id]
#       tags                = { Name = "kms-endpoint" }
#     },
#     logs = {
#       service             = "logs"
#       service_type        = "Interface"
#       tags                = { Name = "logs-endpoint" }
#       private_dns_enabled = true
#       subnet_ids          = module.vpc.private_subnets
#       security_group_ids  = [module.sg_vpc_tls.security_group_id]
#     },
#     sqs = {
#       service             = "sqs"
#       service_type        = "Interface"
#       tags                = { Name = "sqs-endpoint" }
#       private_dns_enabled = true
#       subnet_ids          = module.vpc.private_subnets
#       security_group_ids  = [module.sg_vpc_tls.security_group_id]
#     }
#     ssm = {
#       service             = "ssm"
#       service_type        = "Interface"
#       private_dns_enabled = true
#       subnet_ids          = module.vpc.private_subnets
#       security_group_ids  = [module.sg_vpc_tls.security_group_id]
#       tags                = { Name = "ssm-endpoint" }
#     },
#     ssmmessages = {
#       service             = "ssmmessages"
#       service_type        = "Interface"
#       private_dns_enabled = true
#       subnet_ids          = module.vpc.private_subnets
#       security_group_ids  = [module.sg_vpc_tls.security_group_id]
#       tags                = { Name = "ssm-messages-endpoint" }
#     },
#     sts = {
#       service             = "sts"
#       service_type        = "Interface"
#       private_dns_enabled = true
#       subnet_ids          = module.vpc.private_subnets
#       security_group_ids  = [module.sg_vpc_tls.security_group_id]
#       tags                = { Name = "sts-endpoint" }
#     }
#     s3 = {
#       service         = "s3"
#       service_type    = "Gateway"
#       route_table_ids = flatten([module.vpc.intra_route_table_ids, module.vpc.private_route_table_ids])
#       policy          = file("${path.root}/files/policy/generic.json")
#       tags            = { Name = "s3-endpoint" }
#     }
#   }
# }
