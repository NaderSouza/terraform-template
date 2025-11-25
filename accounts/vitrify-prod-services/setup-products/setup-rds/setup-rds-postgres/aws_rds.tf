# ===============================================
# RDS MODULES - PostgreSQL com Secrets Manager (Versão atualizada)
# ===============================================
module "db_postgres_services" {
  source  = "terraform-aws-modules/rds/aws"
  version = ">= 5.10.0" # Atualize para a versão 5.10.0 ou superior

  identifier = "postgres-${local.aws_environment}-services"

  # Engine
  engine               = "postgres"
  engine_version       = "14"
  family               = "postgres14"
  major_engine_version = "14"
  instance_class       = "db.m5.large"

  # Armazenamento
  allocated_storage     = 20
  max_allocated_storage = 100
  storage_type          = "gp3"

  # Autenticação e Acesso
  db_name  = "db_vitrify_${local.aws_environment}_e63e7a4e"
  username = "postgres_admin"
  port     = 5432

  # Gerenciamento de senha no Secrets Manager
  manage_master_user_password = true

  # Rede
  db_subnet_group_name   = "subnet-group-database"
  vpc_security_group_ids = [aws_security_group.rds_postgres.id]

  # Manutenção e Backup
  maintenance_window      = "Mon:00:00-Mon:03:00"
  backup_window           = "03:00-06:00"
  backup_retention_period = 7

  # Configurações de destruição
  skip_final_snapshot = true
  deletion_protection = false

  # Performance Insights
  performance_insights_enabled          = true
  performance_insights_retention_period = 7

  # Monitoramento aprimorado
  monitoring_interval    = 60
  monitoring_role_name   = "rds-monitoring-role-${local.aws_environment}-data"
  create_monitoring_role = true

  # Parâmetros do banco de dados
  parameters = [
    {
      name  = "autovacuum"
      value = "1"
    },
    {
      name  = "client_encoding"
      value = "utf8"
    }
  ]

  tags = local.aws_default_tags
}

module "db_postgres_data" {
  source  = "terraform-aws-modules/rds/aws"
  version = ">= 5.10.0" # Atualize para a versão 5.10.0 ou superior

  identifier = "postgres-data"

  # Engine
  engine               = "postgres"
  engine_version       = "14"
  family               = "postgres14"
  major_engine_version = "14"
  instance_class       = "db.t3.medium"

  # Armazenamento
  allocated_storage     = 20
  max_allocated_storage = 100
  storage_type          = "gp3"

  # Autenticação e Acesso
  db_name  = "db_data_${local.aws_environment}_629a38fa"
  username = "postgres_admin"
  port     = 5432

  # Gerenciamento de senha no Secrets Manager
  manage_master_user_password = true

  # Rede
  db_subnet_group_name   = "subnet-group-database"
  vpc_security_group_ids = [aws_security_group.rds_postgres.id]

  # Manutenção e Backup
  maintenance_window      = "Mon:00:00-Mon:03:00"
  backup_window           = "03:00-06:00"
  backup_retention_period = 7

  # Configurações de destruição
  skip_final_snapshot = true
  deletion_protection = false

  # Performance Insights
  performance_insights_enabled          = true
  performance_insights_retention_period = 7

  # Monitoramento aprimorado
  monitoring_interval    = 60
  monitoring_role_name   = "rds-monitoring-role-data"
  create_monitoring_role = true

  # Parâmetros do banco de dados
  parameters = [
    {
      name  = "autovacuum"
      value = "1"
    },
    {
      name  = "client_encoding"
      value = "utf8"
    }
  ]

  tags = local.aws_default_tags
}


module "db_postgres_keycloak" {
  source  = "terraform-aws-modules/rds/aws"
  version = ">= 5.10.0" # Atualize para a versão 5.10.0 ou superior

  identifier = "postgres-keycloak"

  # Engine
  engine               = "postgres"
  engine_version       = "14"
  family               = "postgres14"
  major_engine_version = "14"
  instance_class       = "db.m5.large"

  # Armazenamento
  allocated_storage     = 20
  max_allocated_storage = 100
  storage_type          = "gp3"

  # Autenticação e Acesso
  db_name  = "db_keycloak_${local.aws_environment}_8e2d107f"
  username = "postgres_admin"
  port     = 5432

  # Gerenciamento de senha no Secrets Manager
  manage_master_user_password = true

  # Rede
  db_subnet_group_name   = "subnet-group-database"
  vpc_security_group_ids = [aws_security_group.rds_postgres.id]

  # Manutenção e Backup
  maintenance_window      = "Mon:00:00-Mon:03:00"
  backup_window           = "03:00-06:00"
  backup_retention_period = 7

  # Configurações de destruição
  skip_final_snapshot = true
  deletion_protection = false

  # Performance Insights
  performance_insights_enabled          = true
  performance_insights_retention_period = 7

  # Monitoramento aprimorado
  monitoring_interval    = 60
  monitoring_role_name   = "rds-monitoring-role-keycloak"
  create_monitoring_role = true

  # Parâmetros do banco de dados
  parameters = [
    {
      name  = "autovacuum"
      value = "1"
    },
    {
      name  = "client_encoding"
      value = "utf8"
    }
  ]

  tags = local.aws_default_tags
}
