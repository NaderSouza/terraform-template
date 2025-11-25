provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "ssh_access" {
  name        = "ssh-access-sg"
  description = "Security Group allowing SSH access for instance"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    {
    Name = "${var.instance_name}-sg"
  },
  local.labels
  )
}
resource "aws_instance" "bastion" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = data.aws_subnet.selected.id
  key_name                    = var.keypair_name
  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.ssh_access.id]
  iam_instance_profile   = data.aws_iam_instance_profile.ssm.name
  monitoring             = true

  root_block_device {
    volume_type           = var.volume_type
    volume_size           = var.volume_size
    encrypted             = var.volume_encrypted
    delete_on_termination = var.volume_delete_on_termination
  }

  tags = merge(
    {
      Name = var.instance_name
    },
    local.labels
  )
}
resource "aws_eip" "bastion_eip" {
  instance = aws_instance.bastion.id
}

