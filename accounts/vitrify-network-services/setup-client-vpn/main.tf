provider "aws" {
  region = "us-east-1"
}

# ==========================
# Security Group para VPN
# ==========================
resource "aws_security_group" "vpn" {
  name        = "${var.vpn_name}-sg"
  description = "Sg for VPN client"
  vpc_id      = var.vpc_id

  ingress {
    description = "VPN UDP 1194"
    from_port   = 1194
    to_port     = 1194
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "VPN HTTPS 443"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.vpn_name}-sg"
  }
}

# ==========================
# Client VPN Endpoint
# ==========================
resource "aws_ec2_client_vpn_endpoint" "this" {
  description            = var.vpn_name
  client_cidr_block      = var.vpn_cidr
  server_certificate_arn = var.server_cert_arn
  authentication_options {
    type                       = "certificate-authentication"
    root_certificate_chain_arn = var.client_cert_arn
  }

  split_tunnel       = false
  transport_protocol = "udp"
  vpn_port           = 443

  connection_log_options {
    enabled = false
  }

  tags = {
    Name = var.vpn_name
  }
}

# ==========================
# Associação com Subnet
# ==========================
resource "aws_ec2_client_vpn_network_association" "this" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.this.id
  subnet_id              = var.subnet_id
  security_groups        = [aws_security_group.vpn.id]
}

# ==========================
# Rotas
# ==========================
resource "aws_ec2_client_vpn_route" "internet" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.this.id
  destination_cidr_block = "0.0.0.0/0"
  target_vpc_subnet_id   = aws_ec2_client_vpn_network_association.this.subnet_id
}

resource "aws_ec2_client_vpn_route" "internal_routes" {
  for_each = toset(var.internal_routes)

  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.this.id
  destination_cidr_block = each.key
  target_vpc_subnet_id   = aws_ec2_client_vpn_network_association.this.subnet_id
}

# ==========================
# Regra de autorização
# ==========================
resource "aws_ec2_client_vpn_authorization_rule" "all_access" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.this.id
  target_network_cidr    = "0.0.0.0/0"
  authorize_all_groups   = true
  description            = "Allow all authenticated clients"
}
