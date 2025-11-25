# ==================================================================
# RESOURCE - AWS EC2 - KEY PAIR SYMMETRIC ENCRYPTION
# ==================================================================

resource "aws_ssm_parameter" "ssh_private_key" {
  name        = "/instance/ec2/key-pair/${local.global.keypair}/ssh-private-key"
  description = "Instance Parameter Store - EC2 Private Key"
  type        = "SecureString"
  value       = tls_private_key.rsa_tls.private_key_openssh
}

resource "aws_ssm_parameter" "rsa_private_key" {
  name        = "/instance/ec2/key-pair/${local.global.keypair}/rsa-private-key"
  description = "Instance Parameter Store - EC2 Private Key"
  type        = "SecureString"
  value       = tls_private_key.rsa_tls.private_key_pem
}

resource "aws_ssm_parameter" "ssh_public_key" {
  name        = "/instance/ec2/key-pair/${local.global.keypair}/ssh-public-key"
  description = "Instance Parameter Store - EC2 Public Key"
  type        = "SecureString"
  value       = tls_private_key.rsa_tls.public_key_openssh
}
resource "aws_ssm_parameter" "rsa_public_key" {
  name        = "/instance/ec2/key-pair/${local.global.keypair}/rsa-public-key"
  description = "Instance Parameter Store - EC2 Public Key"
  type        = "SecureString"
  value       = tls_private_key.rsa_tls.public_key_pem
}