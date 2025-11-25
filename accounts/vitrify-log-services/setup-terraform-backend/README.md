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
| <a name="module_kms_bucket"></a> [kms\_bucket](#module\_kms\_bucket) | terraform-aws-modules/kms/aws | ~> 2.1 |
| <a name="module_kms_bucket_replication"></a> [kms\_bucket\_replication](#module\_kms\_bucket\_replication) | terraform-aws-modules/kms/aws | ~> 2.1 |
| <a name="module_kms_dynamodb"></a> [kms\_dynamodb](#module\_kms\_dynamodb) | terraform-aws-modules/kms/aws | ~> 2.1 |
| <a name="module_s3_bucket"></a> [s3\_bucket](#module\_s3\_bucket) | terraform-aws-modules/s3-bucket/aws | ~> 3.15 |
| <a name="module_s3_bucket_replication"></a> [s3\_bucket\_replication](#module\_s3\_bucket\_replication) | terraform-aws-modules/s3-bucket/aws | ~> 3.15 |

## Resources

| Name | Type |
|------|------|
| [aws_dynamodb_table.terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |
| [aws_iam_policy.replication_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.replication_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.replication_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.allow_tf_remote_state_from_root_account](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.bucket_encryption](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.dynamodb_encryption](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.replication_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.replication_bucket_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_account_id"></a> [aws\_account\_id](#output\_aws\_account\_id) | Selected AWS Account ID |
| <a name="output_aws_bucket_arn"></a> [aws\_bucket\_arn](#output\_aws\_bucket\_arn) | The S3 Bucket ARN used to store your Terraform States |
| <a name="output_aws_bucket_id"></a> [aws\_bucket\_id](#output\_aws\_bucket\_id) | The S3 Bucket ID used to store your Terraform States |
| <a name="output_aws_dynamodb_arn"></a> [aws\_dynamodb\_arn](#output\_aws\_dynamodb\_arn) | The DynamoDB ARN used to lock your Terraform States |
| <a name="output_aws_dynamodb_id"></a> [aws\_dynamodb\_id](#output\_aws\_dynamodb\_id) | The DynamoDB ID used to lock your Terraform States |
| <a name="output_aws_region"></a> [aws\_region](#output\_aws\_region) | Details about selected AWS region |
