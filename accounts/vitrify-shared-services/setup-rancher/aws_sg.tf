# ==================================================================
# MODULE AWS SG - ALB
# ==================================================================

module "sg_alb_rancher" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.1"

  name        = "alb_sg_rancher"
  description = "Allow ALB Rancher"
  vpc_id      = data.aws_vpc.selected.id
  ingress_with_cidr_blocks = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  egress_rules = ["all-all"]
  tags = {
    Name = "sg-ec2-rancher"
  }
}

# ==================================================================
# MODULE AWS SG - EC2
# ==================================================================

module "sg_ec2_rancher" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.1"

  name        = "sg_ec2_rancher"
  description = "Allow EC2 Rancher inbound traffic"
  vpc_id      = data.aws_vpc.selected.id
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  egress_rules = ["all-all"]
  tags = {
    Name = "alb-sg-rancher"
  }
}
