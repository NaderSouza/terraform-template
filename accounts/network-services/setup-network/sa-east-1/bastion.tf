# ==============================================================================
# MODULE - EC2 BASTION
# ==============================================================================
module "bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.6"

  create                      = true
  name                        = local.bastion_name
  instance_type               = "t3a.medium"
  ami                         = data.aws_ami.ubuntu.id
  key_name                    = "${local.account_name}-${local.region}"
  monitoring                  = true
  subnet_id                   = local.subnet_public_ids_sa[0]
  vpc_security_group_ids      = [module.sg_bastion.security_group_id]
  associate_public_ip_address = true
  iam_instance_profile        = "custom-role-ssm"
  enable_volume_tags          = false
  root_block_device = [
    {
      delete_on_termination = true
      volume_type           = "gp3"
      volume_size           = "16"
      tags = {
        Name = "${local.bastion_name}-root-block"
      }
    }
  ]
}

module "sg_bastion" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.1"

  name        = "sg_ec2_bastion"
  description = "Allow EC2 bastion inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

  egress_rules = ["all-all"]

  tags = {
    Name = "sg-ec2-bastion"
  }
}

module "key_pair" {
  source  = "terraform-aws-modules/key-pair/aws"
  version = "~> 2.0"

  key_name           = "${local.account_name}-${local.region}"
  create_private_key = true
}

module "secrets_manager_key_pair" {
  source  = "terraform-aws-modules/secrets-manager/aws"
  version = "~> 1.1"

  # Secret
  name                    = "/instances/ssh-key/${local.account_name}-${local.region}"
  description             = "EC2 default SSH Key to ${local.account_name} instances in ${local.region}"
  recovery_window_in_days = 30

  # Policy
  block_public_policy = true

  # Version
  secret_string = jsonencode({
    SSH_PRIVATE_PEM     = module.key_pair.private_key_pem
    SSH_PUBLIC_PEM      = module.key_pair.public_key_pem
    SSH_PRIVATE_OPENSSH = module.key_pair.private_key_openssh
    SSH_PUBLIC_OPENSSH  = module.key_pair.public_key_openssh
  })
}