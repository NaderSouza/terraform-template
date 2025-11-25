output "nlb_arn" {
  description = "ARN do Network Load Balancer criado"
  value       = module.network.arn
}

output "nlb_dns_name" {
  description = "DNS Name do Network Load Balancer"
  value       = module.network.dns_name
}

output "nlb_listener_arn" {
  description = "ARN do listener TCP:443 do NLB"
  value       = aws_lb_listener.nlb_listener.arn
}

output "nlb_target_group_arn" {
  description = "ARN do Target Group do NLB que aponta para o ALB"
  value       = aws_lb_target_group.nlb_to_alb.arn
}

output "alb_arn" {
  description = "ARN do ALB do EKS utilizado como target"
  value       = data.aws_lb.eks_alb.arn
}

output "alb_dns_name" {
  description = "DNS Name do ALB do EKS"
  value       = data.aws_lb.eks_alb.dns_name
}
