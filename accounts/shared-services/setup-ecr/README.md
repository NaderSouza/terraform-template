<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (1.6.2)

- <a name="requirement_aws"></a> [aws](#requirement\_aws) (~> 5.38)

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider\_aws) (~> 5.38)

- <a name="provider_random"></a> [random](#provider\_random)

## Modules

The following Modules are called:

### <a name="module_private_ecr"></a> [private\_ecr](#module\_private\_ecr)

Source: terraform-aws-modules/ecr/aws

Version:

### <a name="module_public_ecr"></a> [public\_ecr](#module\_public\_ecr)

Source: terraform-aws-modules/ecr/aws

Version:

## Resources

The following resources are used by this module:

- [random_string.repo_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) (resource)
- [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) (data source)
- [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) (data source)

## Required Inputs

No required inputs.

## Optional Inputs

No optional inputs.

## Outputs

The following outputs are exported:

### <a name="output_repository_arn"></a> [repository\_arn](#output\_repository\_arn)

Description: Full ARN of the repository

### <a name="output_repository_name"></a> [repository\_name](#output\_repository\_name)

Description: Name of the repository

### <a name="output_repository_registry_id"></a> [repository\_registry\_id](#output\_repository\_registry\_id)

Description: The registry ID where the repository was created

### <a name="output_repository_url"></a> [repository\_url](#output\_repository\_url)

Description:  The URL of the repository
<!-- END_TF_DOCS -->