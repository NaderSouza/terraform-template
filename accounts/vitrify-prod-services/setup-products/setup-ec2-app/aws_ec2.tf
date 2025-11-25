# ===============================================
# EC2 MODULE
# ===============================================
module "ec2_instances" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.0"

  for_each = local.ec2_instance_map

  name          = each.key
  instance_type = each.value.instance_type
  ami           = local.global.ec2.ami
  key_name      = local.global.keypair
  user_data     = each.value.user_data != null ? each.value.user_data : null


  vpc_security_group_ids = [
    module.security_groups[each.value.security_group].security_group_id
  ]

  subnet_id = element(data.aws_subnets.selected.ids, each.value.subnet_index)


  monitoring           = true
  iam_instance_profile = data.aws_iam_instance_profile.ssm_profile.name
  create_eip           = false

  root_block_device = [{
    encrypted             = local.global.ebs.encrypted
    delete_on_termination = local.global.ebs.delete_on_termination
    volume_type           = local.global.ebs.volume_type
    volume_size           = each.value.volume_size
  }]

  tags = merge(
    {
      Name = "${each.key}"
    },
    local.aws_default_tags
  )
  depends_on = [aws_key_pair.public_gen]
}

# ===============================================
# EC2 NETWORK INTERFACE
# ===============================================
# resource "aws_network_interface" "database_interface" {
#   subnet_id   = data.aws_subnets.database.ids[0]
#   private_ips = ["10.164.28.10"]

#   attachment {
#     instance     = module.ec2_instances["SPVMSQLSD04"].id
#     device_index = 1
#   }
#   tags = {
#     Name = "eni-${local.aws_environment}-sql-database"
#   }
# }