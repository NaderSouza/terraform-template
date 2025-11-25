# ==================================================================
# AWS ALB - RANCHER
# ==================================================================

resource "aws_lb" "rancher" {
  name               = "alb-rancher-${local.aws_environment}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [module.sg_alb_rancher.security_group_id]
  subnets            = local.aws_network.subnet_public_ids
}

# ==================================================================
# AWS ALB - HTTPS
# ==================================================================

resource "aws_lb_listener" "rancher_https" {
  load_balancer_arn = aws_lb.rancher.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = local.aws_certificate_arn_default
  default_action {
    type = "fixed-response"
    fixed_response {
      status_code  = 200
      content_type = "text/plain"
      message_body = "OK"
    }
  }
}

resource "aws_lb_listener_rule" "rancher_https" {
  listener_arn = aws_lb_listener.rancher_https.arn
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.rancher.arn
  }
  condition {
    host_header {
      values = [local.rancher_instance.server_url]
    }
  }
}

# ==================================================================
# AWS ALB LISTENER - HTTP
# ==================================================================

resource "aws_lb_listener" "rancher_http" {
  load_balancer_arn = aws_lb.rancher.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type = "fixed-response"
    fixed_response {
      status_code  = 200
      content_type = "text/plain"
      message_body = "OK"
    }
  }
}

resource "aws_lb_listener_rule" "rancher_http" {
  listener_arn = aws_lb_listener.rancher_http.arn
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.rancher.arn
  }
  condition {
    host_header {
      values = [local.rancher_instance.server_url]
    }
  }
}

# ==================================================================
# AWS TARGET GROUP
# ==================================================================

resource "aws_lb_target_group" "rancher" {
  name     = "tg-rancher-${local.aws_environment}"
  port     = 443
  protocol = "HTTPS"
  vpc_id   = data.aws_vpc.selected.id
}

resource "aws_lb_target_group_attachment" "rancher" {
  target_group_arn = aws_lb_target_group.rancher.arn
  target_id        = module.ec2_rancher.id
  port             = 443
}
