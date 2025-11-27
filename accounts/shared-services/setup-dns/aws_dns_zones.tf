# ==================================================================
# MODULE AWS ROUTE53 - PRIVATE ZONES
# ==================================================================

module "private_zones" {
  source  = "terraform-aws-modules/route53/aws//modules/zones"
  version = "~> 2.11"

  zones = {
    "${local.aws_dns_default}" = {
      comment = "AWS Route53 Private Zone ${local.aws_dns_default}"
      vpc = [
        {
          vpc_id     = data.aws_vpc.selected.id
          vpc_region = local.aws_region
        }
      ]
    }
  }
}

# ==================================================================
# MODULE AWS ROUTE53 - PUBLIC ZONES
# ==================================================================

module "public_zones" {
  source  = "terraform-aws-modules/route53/aws//modules/zones"
  version = "~> 2.11"

  zones = {
    "${local.aws_dns_default}" = {
      comment = "AWS Route53 Public Zone ${local.aws_dns_default}"
      tags = {
        Name = local.aws_dns_default
      }
    }
  }
}
