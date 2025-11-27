resource "tls_private_key" "bastion_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "bastion_keypair" {
  key_name   = "teckSolucoes-stage-bastion"
  public_key = tls_private_key.bastion_key.public_key_openssh
}

resource "local_file" "private_key" {
  content              = tls_private_key.bastion_key.private_key_pem
  filename             = "${path.module}/teckSolucoes-stage-bastion.pem"
  file_permission      = "0400"
  directory_permission = "0700"
}
