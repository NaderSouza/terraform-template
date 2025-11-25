<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (1.6.2)

- <a name="requirement_aws"></a> [aws](#requirement\_aws) (~> 5.38)

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider\_aws) (~> 5.38)

## Modules

The following Modules are called:

### <a name="module_ec2_instance"></a> [ec2\_instance](#module\_ec2\_instance)

Source: terraform-aws-modules/ec2-instance/aws

Version:

## Resources

The following resources are used by this module:

- [aws_security_group.ssh_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) (resource)
- [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) (data source)
- [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) (data source)
- [aws_subnets.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) (data source)
- [aws_vpc.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) (data source)

## Required Inputs

No required inputs.

## Optional Inputs

No optional inputs.

## Outputs

The following outputs are exported:

### <a name="output_ami_ids"></a> [ami\_ids](#output\_ami\_ids)

Description: n/a

### <a name="output_instance_ids"></a> [instance\_ids](#output\_instance\_ids)

Description: IDs das instâncias EC2

### <a name="output_instance_states"></a> [instance\_states](#output\_instance\_states)

Description: Estados das instâncias EC2

### <a name="output_private_ips"></a> [private\_ips](#output\_private\_ips)

Description: Endereços IP privados das instâncias EC2

### <a name="output_public_ips"></a> [public\_ips](#output\_public\_ips)

Description: Endereços IP públicos das instâncias EC2
<!-- END_TF_DOCS -->