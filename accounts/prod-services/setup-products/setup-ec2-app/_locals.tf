locals {
  client_name = "teckSolucoes"
  # ==================================================================
  # AWS GENERAL
  # ==================================================================
  aws_account_id  = "582577266226"
  aws_environment = "prod"
  aws_region      = "us-east-1"

  # ==================================================================
  # AWS EC2 GLOBAL
  # ==================================================================
  global = {
    ec2 = {
      ami         = "ami-05ffe3c48a9991133"
      iam_profile = "custom-role-ssm"
    }
    ebs = {
      encrypted             = true
      delete_on_termination = true
      volume_type           = "gp3"
    }
    keypair = "${local.client_name}-${local.aws_environment}-keypair"
  }

  # ==================================================================
  # LOCALS - EC2 INSTANCES DEFINITION
  # ==================================================================
  ec2_instances = {
    app-teckSolucoes-prod-tf8gnl = {
      count          = 1
      instance_type  = "m5.xlarge"
      volume_size    = 8
      security_group = "rdp-access"
      subnet_index   = 0 # us-east-1a
    },
    asp-teckSolucoes-prod-38e25ca3 = {
      count          = 1
      instance_type  = "m5.large"
      volume_size    = 8 # 8 GiB
      security_group = "rdp-access"
      subnet_index   = 1 # us-east-1b
    },
    app-teckSolucoes-prod-tf8gnl-secondary = {
      count          = 1
      instance_type  = "m5.large"
      volume_size    = 8 # 8 GiB
      security_group = "rdp-access"
      subnet_index   = 0 # us-east-1a
    },
    # app-teckSolucoes-prod-3cu1o2 = {
    #   count          = 1
    #   instance_type  = "t3.small"
    #   volume_size    = 170
    #   security_group = "rdp-access"
    #   subnet_index   = 0 # us-east-1a
    # },
    # SPCLSEGU01 = {
    #   count          = 1
    #   instance_type  = "r5.large"
    #   volume_size    = 140
    #   security_group = "rdp-access"
    #   subnet_index   = 1 # us-east-1b
    # },
    # SPCLSEGU02 = {
    #   count          = 1
    #   instance_type  = "r5.large"
    #   volume_size    = 140
    #   security_group = "rdp-access"
    #   subnet_index   = 2 # us-east-1c
    # },
    # SPVMSQLSD04 = { # BANCO DE DADOS
    #   count          = 1
    #   instance_type  = "m5.4xlarge"
    #   volume_size    = 2400
    #   security_group = "rdp-access"
    #   subnet_index   = 2 # us-east-1c
    # },
    # SPADCNC5 = {
    #   count          = 1
    #   instance_type  = "c5.xlarge"
    #   volume_size    = 100
    #   security_group = "rdp-access"
    #   subnet_index   = 0 # us-east-1a
    # },
    # UBUNTU-RABBITMQ = {
    #   count          = 1
    #   instance_type  = "c5.xlarge"
    #   volume_size    = 100
    #   security_group = "rdp-access"
    #   subnet_index   = 0 # us-east-1a
    # }
  }

  # ==================================================================
  # EC2 USER DATA
  # ==================================================================
  ec2_instances_with_userdata = {
    # "api-brb-completo" = <<-EOT
    #   <powershell>
    #   ping 8.8.8.8
    #   </powershell>
    # EOT

    # "seguridade" = <<-EOT
    #   <powershell>
    #   ping 8.8.8.8
    #   </powershell>
    # EOT
  }

  # ==================================================================
  # EC2 FLATTEN
  # ==================================================================
  ec2_instance_flat = flatten([
    for name, conf in local.ec2_instances : [
      for idx in range(conf.count) : {
        name           = "${name}"
        instance_type  = conf.instance_type
        volume_size    = conf.volume_size
        security_group = conf.security_group
        index          = idx
        base_name      = name
        user_data      = lookup(local.ec2_instances_with_userdata, name, null)
        subnet_index   = conf.subnet_index
      }
    ]
  ])


  # ==================================================================
  # EC2 MAP
  # ==================================================================
  ec2_instance_map = {
    for inst in local.ec2_instance_flat : inst.name => inst
  }

  # ==================================================================
  # AWS NETWORK
  # ==================================================================
  aws_network = {
    vpc_name    = "vpc-${local.aws_environment}-services"
    subnet_type = "private"
  }


  # ==================================================================
  # LABELS
  # ==================================================================
  aws_default_tags = {
    cost_allocation_business_unit  = "setup-ec2"
    cost_allocation_product        = "${local.client_name}"
    operation_support_account_name = "${local.client_name}-${local.aws_environment}-services"
    operation_support_criticality  = "medium"
    operation_support_environment  = local.aws_environment
    operation_support_team         = "cloud"
    source_code                    = "https://gitlab.com/nuageit/delivery/${local.client_name}/cloud-management"
    source_project                 = "setup-ec2"
  }

}
