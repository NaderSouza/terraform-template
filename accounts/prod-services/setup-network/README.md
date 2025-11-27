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
| <a name="module_sa_east_1"></a> [sa\_east\_1](#module\_sa\_east\_1) | ./sa-east-1 | n/a |
| <a name="module_us_east_1"></a> [us\_east\_1](#module\_us\_east\_1) | ./us-east-1 | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_account_id"></a> [aws\_account\_id](#output\_aws\_account\_id) | Selected AWS Account ID |
| <a name="output_aws_region"></a> [aws\_region](#output\_aws\_region) | Details about selected AWS region |
| <a name="output_subnet_database_cidr_blocks_us"></a> [subnet\_database\_cidr\_blocks\_us](#output\_subnet\_database\_cidr\_blocks\_us) | List of database CIDR blocks us-east-1 region |
| <a name="output_subnet_database_ids_us"></a> [subnet\_database\_ids\_us](#output\_subnet\_database\_ids\_us) | Subnet database IDs us-east-1 region |
| <a name="output_subnet_intra_cidr_blocks_us"></a> [subnet\_intra\_cidr\_blocks\_us](#output\_subnet\_intra\_cidr\_blocks\_us) | List of intra CIDR blocks us-east-1 region |
| <a name="output_subnet_intra_ids_us"></a> [subnet\_intra\_ids\_us](#output\_subnet\_intra\_ids\_us) | Subnet intra IDs us-east-1 region |
| <a name="output_subnet_private_cidr_blocks_us"></a> [subnet\_private\_cidr\_blocks\_us](#output\_subnet\_private\_cidr\_blocks\_us) | List of private CIDR blocks us-east-1 region |
| <a name="output_subnet_private_ids_us"></a> [subnet\_private\_ids\_us](#output\_subnet\_private\_ids\_us) | Subnet private IDs us-east-1 region |
| <a name="output_subnet_public_cidr_blocks_us"></a> [subnet\_public\_cidr\_blocks\_us](#output\_subnet\_public\_cidr\_blocks\_us) | List of public CIDR blocks us-east-1 region |
| <a name="output_subnet_public_ids_us"></a> [subnet\_public\_ids\_us](#output\_subnet\_public\_ids\_us) | Subnet public IDs us-east-1 region |
| <a name="output_vpc_cidr_us"></a> [vpc\_cidr\_us](#output\_vpc\_cidr\_us) | VPC CIDR us-east-1 region |
| <a name="output_vpc_id_us"></a> [vpc\_id\_us](#output\_vpc\_id\_us) | VPC ID us-east-1 region |
