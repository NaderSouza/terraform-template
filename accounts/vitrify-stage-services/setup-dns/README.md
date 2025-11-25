## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.6.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.38 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.38.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_private_zones"></a> [private\_zones](#module\_private\_zones) | terraform-aws-modules/route53/aws//modules/zones | ~> 2.11 |
| <a name="module_public_zones"></a> [public\_zones](#module\_public\_zones) | terraform-aws-modules/route53/aws//modules/zones | ~> 2.11 |
| <a name="module_sa_east_1"></a> [sa\_east\_1](#module\_sa\_east\_1) | ./sa-east-1 | n/a |
| <a name="module_us_east_1"></a> [us\_east\_1](#module\_us\_east\_1) | ./us-east-1 | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [aws_vpc.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_account_id"></a> [aws\_account\_id](#output\_aws\_account\_id) | Selected AWS Account ID |
| <a name="output_aws_acm_certificate_arn_sa"></a> [aws\_acm\_certificate\_arn\_sa](#output\_aws\_acm\_certificate\_arn\_sa) | ACM Certificate ARN - South America |
| <a name="output_aws_acm_certificate_arn_us"></a> [aws\_acm\_certificate\_arn\_us](#output\_aws\_acm\_certificate\_arn\_us) | ACM Certificate ARN - US East |
| <a name="output_aws_dns_default"></a> [aws\_dns\_default](#output\_aws\_dns\_default) | Default DNS |
| <a name="output_aws_region"></a> [aws\_region](#output\_aws\_region) | Details about selected AWS region |
| <a name="output_aws_route53_public_ns_records"></a> [aws\_route53\_public\_ns\_records](#output\_aws\_route53\_public\_ns\_records) | Public Route 53 Name Server Records |
