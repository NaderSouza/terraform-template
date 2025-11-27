## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.31 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws.sa-east-1"></a> [aws.sa-east-1](#provider\_aws.sa-east-1) | >= 5.31 |
| <a name="provider_aws.us-east-1"></a> [aws.us-east-1](#provider\_aws.us-east-1) | >= 5.31 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_sa_east_1"></a> [sa\_east\_1](#module\_sa\_east\_1) | ./sa-east-1 | n/a |
| <a name="module_us_east_1"></a> [us\_east\_1](#module\_us\_east\_1) | ./us-east-1 | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_ec2_transit_gateway_peering_attachment.cross_region](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_peering_attachment) | resource |
| [aws_ec2_transit_gateway_peering_attachment_accepter.cross_region](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_peering_attachment_accepter) | resource |
| [aws_ec2_transit_gateway_route.cross_region_route_sa](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_route) | resource |
| [aws_ec2_transit_gateway_route.cross_region_route_us](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_route) | resource |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_peering_cidr_sa"></a> [peering\_cidr\_sa](#output\_peering\_cidr\_sa) | CIDR Range Peering sa-east-1 region |
| <a name="output_peering_cidr_us"></a> [peering\_cidr\_us](#output\_peering\_cidr\_us) | CIDR Range Peering us-east-1 region |
| <a name="output_tgw_id_sa"></a> [tgw\_id\_sa](#output\_tgw\_id\_sa) | Transit Gateway ID sa-east-1 region |
| <a name="output_tgw_id_us"></a> [tgw\_id\_us](#output\_tgw\_id\_us) | Transit Gateway ID us-east-1 region |
