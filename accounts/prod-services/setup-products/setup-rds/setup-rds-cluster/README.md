<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement_terraform) (1.9.7)

- <a name="requirement_aws"></a> [aws](#requirement_aws) (~> 5.38)

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider_aws) (~> 5.38)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [aws_db_parameter_group.custom](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_parameter_group) (resource)
- [aws_db_subnet_group.rds_clusters](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) (resource)
- [aws_rds_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster) (resource)
- [aws_rds_cluster_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_instance) (resource)
- [aws_rds_cluster_parameter_group.custom](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_parameter_group) (resource)
- [aws_security_group.rds_clusters](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) (resource)
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

### <a name="output_rds_cluster_endpoints"></a> [rds_cluster_endpoints](#output_rds_cluster_endpoints)

Description: Endpoints and ports for each managed RDS cluster

### <a name="output_rds_cluster_instances"></a> [rds_cluster_instances](#output_rds_cluster_instances)

Description: Instance level information for each cluster instance

### <a name="output_rds_cluster_security_groups"></a> [rds_cluster_security_groups](#output_rds_cluster_security_groups)

Description: Security group identifiers for each cluster
<!-- END_TF_DOCS -->

## Como reutilizar

- Mantenha toda a configuração em `locals`, principalmente em `local.rds_cluster_defaults` e `local.rds_clusters`.
- Para criar um novo banco basta adicionar outra entrada em `local.rds_clusters`, definindo `engine`, `engine_version`, `family` e o mapa `instances`. Cada instância pode sobrescrever `instance_class`, `promotion_tier`, `monitoring_interval` e `performance_insights`.
- Por padrão o módulo cria o grupo de sub-redes e os security groups. Caso deseje reutilizar recursos existentes, informe `db_subnet_group_name`, `db_cluster_parameter_group_name` e/ou `db_parameter_group_name` na configuração do cluster.
- Use o campo `allowed_cidr_blocks` para controlar o acesso por porta. Assim é possível reutilizar o mesmo módulo para PostgreSQL, MySQL, Oracle ou qualquer engine suportada pelo serviço RDS.
