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

### <a name="module_cdn"></a> [cdn](#module\_cdn)

Source: terraform-aws-modules/cloudfront/aws

Version:

## Resources

The following resources are used by this module:

- [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) (data source)
- [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) (data source)

## Required Inputs

No required inputs.

## Optional Inputs

No optional inputs.

## Outputs

The following outputs are exported:

### <a name="output_cloudfront_distribution_arn"></a> [cloudfront\_distribution\_arn](#output\_cloudfront\_distribution\_arn)

Description: The ARN (Amazon Resource Name) for the distribution.

### <a name="output_cloudfront_distribution_caller_reference"></a> [cloudfront\_distribution\_caller\_reference](#output\_cloudfront\_distribution\_caller\_reference)

Description: Internal value used by CloudFront to allow future updates to the distribution configuration.

### <a name="output_cloudfront_distribution_domain_name"></a> [cloudfront\_distribution\_domain\_name](#output\_cloudfront\_distribution\_domain\_name)

Description: The domain name corresponding to the distribution.

### <a name="output_cloudfront_distribution_etag"></a> [cloudfront\_distribution\_etag](#output\_cloudfront\_distribution\_etag)

Description: The current version of the distribution's information.

### <a name="output_cloudfront_distribution_hosted_zone_id"></a> [cloudfront\_distribution\_hosted\_zone\_id](#output\_cloudfront\_distribution\_hosted\_zone\_id)

Description: The CloudFront Route 53 zone ID that can be used to route an Alias Resource Record Set to.

### <a name="output_cloudfront_distribution_id"></a> [cloudfront\_distribution\_id](#output\_cloudfront\_distribution\_id)

Description: The identifier for the distribution.

### <a name="output_cloudfront_distribution_in_progress_validation_batches"></a> [cloudfront\_distribution\_in\_progress\_validation\_batches](#output\_cloudfront\_distribution\_in\_progress\_validation\_batches)

Description: The number of invalidation batches currently in progress.

### <a name="output_cloudfront_distribution_last_modified_time"></a> [cloudfront\_distribution\_last\_modified\_time](#output\_cloudfront\_distribution\_last\_modified\_time)

Description: The date and time the distribution was last modified.

### <a name="output_cloudfront_distribution_status"></a> [cloudfront\_distribution\_status](#output\_cloudfront\_distribution\_status)

Description: The current status of the distribution. Deployed if the distribution's information is fully propagated throughout the Amazon CloudFront system.

### <a name="output_cloudfront_distribution_tags"></a> [cloudfront\_distribution\_tags](#output\_cloudfront\_distribution\_tags)

Description: Tags of the distribution.

### <a name="output_cloudfront_distribution_trusted_signers"></a> [cloudfront\_distribution\_trusted\_signers](#output\_cloudfront\_distribution\_trusted\_signers)

Description: List of nested attributes for active trusted signers, if the distribution is set up to serve private content with signed URLs.

### <a name="output_cloudfront_monitoring_subscription_id"></a> [cloudfront\_monitoring\_subscription\_id](#output\_cloudfront\_monitoring\_subscription\_id)

Description: The ID of the CloudFront monitoring subscription, which corresponds to the `distribution_id`.

### <a name="output_cloudfront_origin_access_controls"></a> [cloudfront\_origin\_access\_controls](#output\_cloudfront\_origin\_access\_controls)

Description: The origin access controls created.

### <a name="output_cloudfront_origin_access_controls_ids"></a> [cloudfront\_origin\_access\_controls\_ids](#output\_cloudfront\_origin\_access\_controls\_ids)

Description: The IDs of the origin access identities created.

### <a name="output_cloudfront_origin_access_identities"></a> [cloudfront\_origin\_access\_identities](#output\_cloudfront\_origin\_access\_identities)

Description: The origin access identities created.

### <a name="output_cloudfront_origin_access_identity_iam_arns"></a> [cloudfront\_origin\_access\_identity\_iam\_arns](#output\_cloudfront\_origin\_access\_identity\_iam\_arns)

Description: The IAM ARNs of the origin access identities created.

### <a name="output_cloudfront_origin_access_identity_ids"></a> [cloudfront\_origin\_access\_identity\_ids](#output\_cloudfront\_origin\_access\_identity\_ids)

Description: The IDs of the origin access identities created.

### <a name="output_cloudfront_vpc_origin_ids"></a> [cloudfront\_vpc\_origin\_ids](#output\_cloudfront\_vpc\_origin\_ids)

Description: The IDs of the VPC origin created.
<!-- END_TF_DOCS -->