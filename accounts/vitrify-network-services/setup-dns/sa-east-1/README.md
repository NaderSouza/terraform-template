## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.6.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.38 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acm_default"></a> [acm\_default](#module\_acm\_default) | terraform-aws-modules/acm/aws | ~> 5.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_dns_default"></a> [aws\_dns\_default](#input\_aws\_dns\_default) | The default DNS server to use | `string` | `""` | no |
| <a name="input_aws_zone_id"></a> [aws\_zone\_id](#input\_aws\_zone\_id) | The zone id for the domain | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acm_certificate_arn"></a> [acm\_certificate\_arn](#output\_acm\_certificate\_arn) | The ARN of the ACM certificate |
