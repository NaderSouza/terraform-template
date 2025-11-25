## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.6.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.38 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.38.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2_rancher"></a> [ec2\_rancher](#module\_ec2\_rancher) | terraform-aws-modules/ec2-instance/aws | ~> 5.6 |
| <a name="module_records_private_rancher"></a> [records\_private\_rancher](#module\_records\_private\_rancher) | terraform-aws-modules/route53/aws//modules/records | ~> 2.11 |
| <a name="module_records_public_rancher"></a> [records\_public\_rancher](#module\_records\_public\_rancher) | terraform-aws-modules/route53/aws//modules/records | ~> 2.11 |
| <a name="module_secrets_manager_rancher"></a> [secrets\_manager\_rancher](#module\_secrets\_manager\_rancher) | terraform-aws-modules/secrets-manager/aws | ~> 1.1 |
| <a name="module_sg_alb_rancher"></a> [sg\_alb\_rancher](#module\_sg\_alb\_rancher) | terraform-aws-modules/security-group/aws | ~> 5.1 |
| <a name="module_sg_ec2_rancher"></a> [sg\_ec2\_rancher](#module\_sg\_ec2\_rancher) | terraform-aws-modules/security-group/aws | ~> 5.1 |

## Resources

| Name | Type |
|------|------|
| [aws_lb.rancher](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.rancher_http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.rancher_https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener_rule.rancher_http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule) | resource |
| [aws_lb_listener_rule.rancher_https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule) | resource |
| [aws_lb_target_group.rancher](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group_attachment.rancher](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |
| [random_password.rancher_admin](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [aws_acm_certificate.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/acm_certificate) | data source |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [aws_route53_zone.private_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |
| [aws_route53_zone.public_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |
| [aws_subnets.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_account_id"></a> [aws\_account\_id](#output\_aws\_account\_id) | Selected AWS Account ID |
| <a name="output_aws_region"></a> [aws\_region](#output\_aws\_region) | Details about selected AWS region |
| <a name="output_rancher_alb_dns_name"></a> [rancher\_alb\_dns\_name](#output\_rancher\_alb\_dns\_name) | Rancher ALB DNS Name |
| <a name="output_rancher_server_url"></a> [rancher\_server\_url](#output\_rancher\_server\_url) | Rancher Server URL |
