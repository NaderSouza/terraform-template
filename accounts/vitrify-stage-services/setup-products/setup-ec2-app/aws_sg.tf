# ===============================================
# SECURITY GROUP FOR SSH
# ===============================================
module "security_groups" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.1"

  for_each = {
    "rdp-access" = {
      name        = "rdp-access"
      description = "Allow RDP access"
      vpc_id      = data.aws_vpc.selected.id
      ingress_with_cidr_blocks = [
        {
          from_port   = 3389
          to_port     = 3389
          protocol    = "tcp"
          description = "RDP access"
          cidr_blocks = data.aws_vpc.selected.cidr_block
        }
      ]
    }

    "ssh-access" = {
      name        = "ssh-access"
      description = "Allow SSH access"
      vpc_id      = data.aws_vpc.selected.id
      ingress_with_cidr_blocks = [
        {
          from_port   = 22
          to_port     = 22
          protocol    = "tcp"
          description = "SSH access"
          cidr_blocks = data.aws_vpc.selected.cidr_block
        }
      ]
    }
  }

  name                       = each.value.name
  description                = each.value.description
  vpc_id                     = each.value.vpc_id
  ingress_with_cidr_blocks   = each.value.ingress_with_cidr_blocks
  egress_rules               = ["all-all"]

  tags = local.aws_default_tags
}
