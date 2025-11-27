# ==================================================================
# RESOURCE - AWS API GATEWAY REST API
# ==================================================================

resource "aws_api_gateway_rest_api" "api_gateway" {
  name        = "${local.labels.cost_allocation_business_unit}-apigateway"
  description = "API Gateway para ${local.aws_environment}"
  endpoint_configuration {
    types = ["EDGE"]
  }
}

# ==================================================================
# RESOURCE - AWS API GATEWAY DOMAIN NAME
# ==================================================================

resource "aws_api_gateway_domain_name" "api_gateway_domain" {
  domain_name              = "api-gtw.${local.aws_domain}"
  regional_certificate_arn = data.aws_acm_certificate.api_gateway_cert.arn
  endpoint_configuration {
    types = ["REGIONAL"]
  }
  security_policy = "TLS_1_2"
}

# ==================================================================
# RESOURCE - AWS API GATEWAY VPC LINK
# ==================================================================

resource "aws_api_gateway_vpc_link" "api_vpc_link" {
  name        = "${local.labels.cost_allocation_business_unit}-api-vpc-link"
  description = "VPC Link para API Gateway"
  target_arns = [module.network.arn]
}

# ==================================================================
# MODULE - AWS ROUTE53 RECORDS - API GATEWAY
# ==================================================================

module "api_gateway_records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 5.0"

  zone_id = data.aws_route53_zone.public.zone_id
  records = [
    {
      name = "api-gtw"
      type = "A"
      alias = {
        name                   = aws_api_gateway_domain_name.api_gateway_domain.regional_domain_name
        zone_id                = aws_api_gateway_domain_name.api_gateway_domain.regional_zone_id
        evaluate_target_health = false
      }
    }
  ]
}
