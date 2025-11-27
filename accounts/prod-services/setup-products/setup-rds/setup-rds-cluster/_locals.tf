locals {
  # ==================================================================
  # GENERAL
  # ==================================================================
  client_name = "teckSolucoes"

  # ==================================================================
  # AWS GENERAL
  # ==================================================================
  aws_dns_default = "teckSolucoes.tech"
  aws_environment = "prod"
  aws_region      = "us-east-1"

  # ==================================================================
  # AWS NETWORK
  # ==================================================================
  aws_network = {
    vpc_name = "vpc-${local.aws_environment}-services"
    subnet_ids = [
      "subnet-${local.aws_environment}-services-database-${local.aws_region}a",
      "subnet-${local.aws_environment}-services-database-${local.aws_region}b",
      "subnet-${local.aws_environment}-services-database-${local.aws_region}c",
    ]
  }

  # ==================================================================
  # AWS TAGS
  # ==================================================================
  aws_default_tags = {
    cost_allocation_business_unit  = local.aws_environment
    cost_allocation_product        = "setup-rds-cluster"
    operation_support_account_name = "${local.client_name}-${local.aws_environment}-services"
    operation_support_criticality  = "medium"
    operation_support_environment  = local.aws_environment
    operation_support_team         = "cloud"
    source_code                    = "https://gitlab.com/nuageit/delivery/${local.client_name}/cloud-management"
    source_project                 = "setup-rds-cluster"
  }

  # ==================================================================
  # RDS CLUSTER CONFIGURATION (DEFAULTS)
  # ==================================================================
  rds_cluster_defaults = {
    enabled                     = true
    description                 = "Managed RDS cluster"
    engine                      = "aurora-postgresql"
    engine_version              = "15.3"
    family                      = "aurora-postgresql15"
    port                        = 5432
    identifier                  = "aurora-${local.aws_environment}-services"
    master_username             = "cluster_admin"
    database_name               = "db_${local.aws_environment}_services"
    manage_master_user_password = true
    apply_immediately           = false
    backup_retention_period     = 7
    backup_window               = "03:00-06:00"
    maintenance_window          = "Sun:00:00-Sun:03:00"
    deletion_protection         = true
    copy_tags_to_snapshot       = true
    preferred_azs               = []
    storage_encrypted           = true
    kms_key_id                  = null
    db_subnet_group_name        = null
    allowed_cidr_blocks         = ["10.0.0.0/8"]
    cluster_parameters          = []
    instance_parameters         = []
    instances = {
      writer = {
        instance_class      = "db.r6g.large"
        publicly_accessible = false
        promotion_tier      = 1
        monitoring_interval = 0
        monitoring_role_arn = null
        performance_insights = {
          enabled          = true
          retention_period = 7
          kms_key_id       = null
        }
      }
    }
    tags = {}
  }

  # ==================================================================
  # RDS CLUSTERS
  # ==================================================================
  rds_clusters = {
    services_aurora_pg = merge(
      local.rds_cluster_defaults,
      {
        description    = "Aurora PostgreSQL cluster for customer-facing services"
        identifier     = "aurora-postgres-${local.aws_environment}-services"
        engine_version = "15.4"
        database_name  = "db_services_${local.aws_environment}"
        allowed_cidr_blocks = [
          "10.164.32.0/20"
        ]
        instances = {
          writer = {
            instance_class      = "db.r6g.large"
            promotion_tier      = 1
            monitoring_interval = 0
            performance_insights = {
              enabled          = true
              retention_period = 7
            }
          }
          reader = {
            instance_class      = "db.r6g.large"
            promotion_tier      = 2
            monitoring_interval = 0
            performance_insights = {
              enabled          = true
              retention_period = 7
            }
          }
        }
        cluster_parameters = [
          {
            name  = "max_connections"
            value = "500"
          },
          {
            name  = "client_encoding"
            value = "UTF8"
          }
        ]
      }
    )
  }
}
