## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.31 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.31 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_tgw"></a> [tgw](#module\_tgw) | terraform-aws-modules/transit-gateway/aws | ~> 2.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | >= 5.4 |

## Resources

| Name | Type |
|------|------|
| [aws_route.route_sa](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.route_us](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_igw"></a> [igw](#output\_igw) | The ID of the Internet Gateway |
| <a name="output_subnet_private_ids"></a> [subnet\_private\_ids](#output\_subnet\_private\_ids) | List of IDs of private subnets |
| <a name="output_subnet_public_ids"></a> [subnet\_public\_ids](#output\_subnet\_public\_ids) | List of IDs of public subnets |
| <a name="output_tgw_id"></a> [tgw\_id](#output\_tgw\_id) | Transit Gateway ID |
| <a name="output_tgw_troute_tabe_id"></a> [tgw\_troute\_tabe\_id](#output\_tgw\_troute\_tabe\_id) | Transit Gateway Route Table ID |
| <a name="output_vpc"></a> [vpc](#output\_vpc) | VPC ID |
| <a name="output_vpc_cidr"></a> [vpc\_cidr](#output\_vpc\_cidr) | VPC ID |
| <a name="output_vpc_owner"></a> [vpc\_owner](#output\_vpc\_owner) | VPC ID |
