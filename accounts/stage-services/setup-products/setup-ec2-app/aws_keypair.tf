# ===============================================
# EC2 KEYPAIR CREATE
# ===============================================
resource "tls_private_key" "rsa_tls" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "public_gen" {
  key_name   = local.global.keypair
  public_key = tls_private_key.rsa_tls.public_key_openssh
}

resource "local_file" "private_gen" {
  content         = tls_private_key.rsa_tls.private_key_pem
  filename        = "${aws_key_pair.public_gen.key_name}.pem"
  file_permission = "0400"
  depends_on      = [aws_key_pair.public_gen]
}