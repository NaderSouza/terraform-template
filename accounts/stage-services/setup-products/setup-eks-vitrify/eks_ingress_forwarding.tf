# ==================================================================
# KUBERNETES INGRESS - FORWARDED INGRESS NGINX TO ALB
# ==================================================================

resource "kubernetes_ingress_v1" "ingress_forwarding" {
  metadata {
    name      = "forwarding-ingress-nginx"
    namespace = "ingress-nginx"
    labels = {
      app = "forwarding-ingress-nginx"
    }
    annotations = {
      "alb.ingress.kubernetes.io/actions.ssl-redirect"     = "{\"Type\": \"redirect\", \"RedirectConfig\": { \"Protocol\": \"HTTPS\", \"Port\": \"443\", \"StatusCode\": \"HTTP_301\"}}"
      "alb.ingress.kubernetes.io/healthcheck-path"         = "/"
      "alb.ingress.kubernetes.io/load-balancer-attributes" = "idle_timeout.timeout_seconds=600"
      "alb.ingress.kubernetes.io/scheme"                   = "internet-facing"
      "alb.ingress.kubernetes.io/certificate-arn"          = "${local.aws_client_acm}"
      "alb.ingress.kubernetes.io/target-type"              = "instance"
      "alb.ingress.kubernetes.io/subnets"                  = local.aws_eks.subnet_public_ids
      "alb.ingress.kubernetes.io/listen-ports"             = jsonencode([{ "HTTP" = 80, "HTTPS" = 443 }])
      "alb.ingress.kubernetes.io/success-codes"            = "200,404"
      "alb.ingress.kubernetes.io/tags"                     = "Environment=Production,Team=DevOps"
      #"alb.ingress.kubernetes.io/load-balancer-attributes" = "access_logs.s3.enabled=true,access_logs.s3.bucket=${local.aws_account_id}-cloudlogs-balancer,access_logs.s3.prefix=alb"
    }
  }
  spec {
    ingress_class_name = "alb"
    rule {
      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "ssl-redirect"
              port {
                name = "use-annotation"
              }
            }
          }
        }
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "ingress-nginx-controller"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
  wait_for_load_balancer = true
  depends_on = [
    module.eks_addons
  ]
}
