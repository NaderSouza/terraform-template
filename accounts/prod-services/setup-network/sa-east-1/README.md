## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.6.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.38 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.38 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_sg_global_network"></a> [sg\_global\_network](#module\_sg\_global\_network) | terraform-aws-modules/security-group/aws | ~> 5.1 |
| <a name="module_sg_vpc_tls"></a> [sg\_vpc\_tls](#module\_sg\_vpc\_tls) | terraform-aws-modules/security-group/aws | ~> 5.1 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | ~> 5.5 |
| <a name="module_vpc_endpoints"></a> [vpc\_endpoints](#module\_vpc\_endpoints) | terraform-aws-modules/vpc/aws//modules/vpc-endpoints | ~> 5.5 |

## Resources

| Name | Type |
|------|------|
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_environment"></a> [aws\_environment](#input\_aws\_environment) | The name of the AWS environment | `string` | `""` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | The CIDR block for the VPC | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_igw"></a> [igw](#output\_igw) | The ID of the Internet Gateway |
| <a name="output_subnet_database_cidr_blocks"></a> [subnet\_database\_cidr\_blocks](#output\_subnet\_database\_cidr\_blocks) | List of database CIDR blocks |
| <a name="output_subnet_database_ids"></a> [subnet\_database\_ids](#output\_subnet\_database\_ids) | List of IDs of database subnets |
| <a name="output_subnet_intra_cidr_blocks"></a> [subnet\_intra\_cidr\_blocks](#output\_subnet\_intra\_cidr\_blocks) | List of intra CIDR blocks |
| <a name="output_subnet_intra_ids"></a> [subnet\_intra\_ids](#output\_subnet\_intra\_ids) | List of IDs of intra subnets |
| <a name="output_subnet_private_cidr_blocks"></a> [subnet\_private\_cidr\_blocks](#output\_subnet\_private\_cidr\_blocks) | List of private CIDR blocks |
| <a name="output_subnet_private_ids"></a> [subnet\_private\_ids](#output\_subnet\_private\_ids) | List of IDs of private subnets |
| <a name="output_subnet_public_cidr_blocks"></a> [subnet\_public\_cidr\_blocks](#output\_subnet\_public\_cidr\_blocks) | List of public CIDR blocks |
| <a name="output_subnet_public_ids"></a> [subnet\_public\_ids](#output\_subnet\_public\_ids) | List of IDs of public subnets |
| <a name="output_vpc_cidr"></a> [vpc\_cidr](#output\_vpc\_cidr) | VPC CIDR Block |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | VPC ID |
| <a name="output_vpc_owner"></a> [vpc\_owner](#output\_vpc\_owner) | VPC Owner ID |
