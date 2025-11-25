# ===============================================
# EC2 OUTPUT
# ===============================================
# output "instance_ids" {
#   description = "IDs das instâncias EC2"
#   value       = [for instance in module.ec2_instance : instance.id]
# }

# output "public_ips" {
#   description = "Endereços IP públicos das instâncias EC2"
#   value       = [for instance in module.ec2_instance : instance.public_ip]
# }

# output "private_ips" {
#   description = "Endereços IP privados das instâncias EC2"
#   value       = [for instance in module.ec2_instance : instance.private_ip]
# }

# output "instance_states" {
#   description = "Estados das instâncias EC2"
#   value       = [for instance in module.ec2_instance : instance.instance_state]
# }

# output "ami_ids" {
#   value = [for instance in module.ec2_instance : instance.ami]
# }