## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.6.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.38 |
| <a name="requirement_http"></a> [http](#requirement\_http) | ~> 3.4 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | ~> 1.14 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.26 |
| <a name="requirement_rancher2"></a> [rancher2](#requirement\_rancher2) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.38.0 |
| <a name="provider_http"></a> [http](#provider\_http) | 3.4.1 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | 1.14.0 |
| <a name="provider_rancher2"></a> [rancher2](#provider\_rancher2) | 4.0.0 |
| <a name="provider_rancher2.admin"></a> [rancher2.admin](#provider\_rancher2.admin) | 4.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubectl_manifest.rancher_add_cluster](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [rancher2_bootstrap.admin](https://registry.terraform.io/providers/rancher/rancher2/latest/docs/resources/bootstrap) | resource |
| [rancher2_cluster.this](https://registry.terraform.io/providers/rancher/rancher2/latest/docs/resources/cluster) | resource |
| [rancher2_project.devops](https://registry.terraform.io/providers/rancher/rancher2/latest/docs/resources/project) | resource |
| [rancher2_project.fenix](https://registry.terraform.io/providers/rancher/rancher2/latest/docs/resources/project) | resource |
| [rancher2_project.gitops](https://registry.terraform.io/providers/rancher/rancher2/latest/docs/resources/project) | resource |
| [rancher2_project.monitoring](https://registry.terraform.io/providers/rancher/rancher2/latest/docs/resources/project) | resource |
| [rancher2_project.observability](https://registry.terraform.io/providers/rancher/rancher2/latest/docs/resources/project) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_eks_cluster.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster_auth.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [aws_secretsmanager_secret.rancher](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret) | data source |
| [aws_secretsmanager_secret_version.rancher](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) | data source |
| [http_http.yaml_rancher_add_cluster](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_account_id"></a> [aws\_account\_id](#output\_aws\_account\_id) | Selected AWS Account ID |
| <a name="output_aws_region"></a> [aws\_region](#output\_aws\_region) | Details about selected AWS region |
| <a name="output_rancher_cluster_id"></a> [rancher\_cluster\_id](#output\_rancher\_cluster\_id) | Rancher Cluster ID |
| <a name="output_rancher_project_devops_id"></a> [rancher\_project\_devops\_id](#output\_rancher\_project\_devops\_id) | Rancher Project DevOps ID |
| <a name="output_rancher_project_fenix_id"></a> [rancher\_project\_fenix\_id](#output\_rancher\_project\_fenix\_id) | Rancher Project Fenix ID |
| <a name="output_rancher_project_gitops_id"></a> [rancher\_project\_gitops\_id](#output\_rancher\_project\_gitops\_id) | Rancher Project GitOps ID |
| <a name="output_rancher_project_monitoring_id"></a> [rancher\_project\_monitoring\_id](#output\_rancher\_project\_monitoring\_id) | Rancher Project Monitoring ID |
| <a name="output_rancher_project_observability_id"></a> [rancher\_project\_observability\_id](#output\_rancher\_project\_observability\_id) | Rancher Project Observability ID |
