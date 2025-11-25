# ==================================================================
# MODULE - AWS NLB
# ==================================================================

# Busca automática do ALB do EKS pelo ambiente

data "aws_lb" "eks_alb" {
  tags = {
    "ingress.k8s.aws/stack" = "ingress-nginx/forwarding-ingress-nginx"
  }
}

# Target Group do NLB para o ALB (porta 443, tipo alb)
resource "aws_lb_target_group" "nlb_to_alb" {
  name        = "nlb-to-alb"
  port        = 443
  protocol    = "TCP"
  vpc_id      = data.aws_vpc.selected.id
  target_type = "alb"

  health_check {
    path                = "/"
    protocol            = "HTTPS"
    matcher             = "200-499"
    interval            = 30
    timeout             = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

# Attachment do ALB ao TG
resource "aws_lb_target_group_attachment" "attach_alb" {
  target_group_arn = aws_lb_target_group.nlb_to_alb.arn
  target_id        = data.aws_lb.eks_alb.arn
  port             = 443
}

# Listener do NLB na porta 443
resource "aws_lb_listener" "nlb_listener" {
  load_balancer_arn = module.network.arn
  port              = 443
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nlb_to_alb.arn
  }
}

module "network" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 9.16"

  name               = "${local.labels.cost_allocation_business_unit}-api-nlb"
  load_balancer_type = "network"
  internal           = true
  ip_address_type    = "ipv4"

  vpc_id  = data.aws_vpc.selected.id
  subnets = data.aws_subnets.publish.ids

  # Não criar Security Group para NLB
  create_security_group = false

  # Listeners e target_groups podem ser omitidos se for somente VPC Link
}
