# ==================================================================
# MODULE AWS EC2 - RANCHER
# ==================================================================

module "ec2_rancher" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.6"

  create                      = true
  name                        = local.rancher_instance.name
  instance_type               = "t3a.medium"
  ami                         = data.aws_ami.ubuntu.id
  ignore_ami_changes          = true
  monitoring                  = true
  subnet_id                   = local.aws_network.subnet_private_ids[0]
  vpc_security_group_ids      = [module.sg_ec2_rancher.security_group_id]
  associate_public_ip_address = false
  iam_instance_profile        = "custom-role-ssm"
  user_data = templatefile("${path.root}/files/rancher_server", {
    admin_password        = random_password.rancher_admin.result
    docker_version_server = "20.10"
    rancher_version       = "v2.8.2"
    rancher_server_url    = local.rancher_instance.server_url
  })
  enable_volume_tags = false
  root_block_device = [
    {
      delete_on_termination = true
      volume_type           = "gp3"
      volume_size           = "64"
      tags = {
        Name = "rancher-root-block"
      }
    }
  ]
}
