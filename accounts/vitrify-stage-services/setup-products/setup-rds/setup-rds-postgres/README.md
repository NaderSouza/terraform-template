<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (1.9.7)

- <a name="requirement_aws"></a> [aws](#requirement\_aws) (~> 5.38)

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider\_aws) (~> 5.38)

## Modules

The following Modules are called:

### <a name="module_db_postgres"></a> [db\_postgres](#module\_db\_postgres)

Source: terraform-aws-modules/rds/aws

Version: >= 5.10.0

## Resources

The following resources are used by this module:

- [aws_security_group.rds_postgres](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) (resource)
- [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) (data source)
- [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) (data source)
- [aws_subnets.database](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) (data source)
- [aws_vpc.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) (data source)

## Required Inputs

No required inputs.

## Optional Inputs

No optional inputs.

## Outputs

The following outputs are exported:

### <a name="output_db_postgres_instance_arn"></a> [db\_postgres\_instance\_arn](#output\_db\_postgres\_instance\_arn)

Description: The ARN of the RDS instance

### <a name="output_db_postgres_instance_availability_zone"></a> [db\_postgres\_instance\_availability\_zone](#output\_db\_postgres\_instance\_availability\_zone)

Description: The availability zone of the RDS instance

### <a name="output_db_postgres_instance_engine"></a> [db\_postgres\_instance\_engine](#output\_db\_postgres\_instance\_engine)

Description: The database engine

### <a name="output_db_postgres_instance_engine_version"></a> [db\_postgres\_instance\_engine\_version](#output\_db\_postgres\_instance\_engine\_version)

Description: The running version of the database

### <a name="output_db_postgres_instance_hosted_zone_id"></a> [db\_postgres\_instance\_hosted\_zone\_id](#output\_db\_postgres\_instance\_hosted\_zone\_id)

Description: The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)

### <a name="output_db_postgres_instance_identifier"></a> [db\_postgres\_instance\_identifier](#output\_db\_postgres\_instance\_identifier)

Description: The RDS instance identifier

### <a name="output_db_postgres_instance_name"></a> [db\_postgres\_instance\_name](#output\_db\_postgres\_instance\_name)

Description: The database name

### <a name="output_db_postgres_instance_port"></a> [db\_postgres\_instance\_port](#output\_db\_postgres\_instance\_port)

Description: The database port

### <a name="output_db_postgres_instance_resource_id"></a> [db\_postgres\_instance\_resource\_id](#output\_db\_postgres\_instance\_resource\_id)

Description: The RDS Resource ID of this instance

### <a name="output_db_postgres_instance_status"></a> [db\_postgres\_instance\_status](#output\_db\_postgres\_instance\_status)

Description: The RDS instance status

### <a name="output_db_postgres_instance_username"></a> [db\_postgres\_instance\_username](#output\_db\_postgres\_instance\_username)

Description: The master username for the database

### <a name="output_db_postgres_parameter_group_arn"></a> [db\_postgres\_parameter\_group\_arn](#output\_db\_postgres\_parameter\_group\_arn)

Description: The ARN of the db parameter group

### <a name="output_db_postgres_parameter_group_id"></a> [db\_postgres\_parameter\_group\_id](#output\_db\_postgres\_parameter\_group\_id)

Description: The db parameter group id

### <a name="output_db_postgres_subnet_group_arn"></a> [db\_postgres\_subnet\_group\_arn](#output\_db\_postgres\_subnet\_group\_arn)

Description: The ARN of the db subnet group

### <a name="output_db_postgres_subnet_group_id"></a> [db\_postgres\_subnet\_group\_id](#output\_db\_postgres\_subnet\_group\_id)

Description: The db subnet group name
<!-- END_TF_DOCS -->