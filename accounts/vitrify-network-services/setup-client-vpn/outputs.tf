output "vpn_endpoint_id" {
  description = "ID do Client VPN Endpoint"
  value       = aws_ec2_client_vpn_endpoint.this.id
}

output "vpn_network_association_id" {
  description = "ID da associação da VPN com a subnet"
  value       = aws_ec2_client_vpn_network_association.this.id
}

output "vpn_security_group_id" {
  description = "ID do Security Group usado pela VPN"
  value       = aws_security_group.vpn.id
}
