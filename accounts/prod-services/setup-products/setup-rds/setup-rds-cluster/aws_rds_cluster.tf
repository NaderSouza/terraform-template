# ==================================================================
# SUBNET GROUPS (OPTIONAL CREATION)
# ==================================================================
resource "aws_db_subnet_group" "rds_clusters" {
  for_each = {
    for key, cluster in local.rds_clusters_enabled :
    key => cluster
    if try(cluster.db_subnet_group_name, null) == null
  }

  name        = "${each.value.identifier}-subnet-group"
  description = "Subnet group for ${each.value.description}"
  subnet_ids  = data.aws_subnets.database.ids

  tags = merge(local.aws_default_tags, try(each.value.tags, {}), {
    Name = "${each.value.identifier}-subnet-group"
  })
}

# ==================================================================
# PARAMETER GROUPS
# ==================================================================
resource "aws_rds_cluster_parameter_group" "custom" {
  for_each = {
    for key, cluster in local.rds_clusters_enabled :
    key => cluster
    if length(try(cluster.cluster_parameters, [])) > 0
  }

  family = each.value.family
  name   = "${each.value.identifier}-cluster-params"

  dynamic "parameter" {
    for_each = each.value.cluster_parameters
    content {
      name         = parameter.value.name
      value        = parameter.value.value
      apply_method = try(parameter.value.apply_method, "pending-reboot")
    }
  }

  tags = merge(local.aws_default_tags, try(each.value.tags, {}), {
    Name = "${each.value.identifier}-cluster-params"
  })
}

resource "aws_db_parameter_group" "custom" {
  for_each = {
    for key, cluster in local.rds_clusters_enabled :
    key => cluster
    if length(try(cluster.instance_parameters, [])) > 0
  }

  family = each.value.family
  name   = "${each.value.identifier}-instance-params"

  dynamic "parameter" {
    for_each = each.value.instance_parameters
    content {
      name         = parameter.value.name
      value        = parameter.value.value
      apply_method = try(parameter.value.apply_method, "pending-reboot")
    }
  }

  tags = merge(local.aws_default_tags, try(each.value.tags, {}), {
    Name = "${each.value.identifier}-instance-params"
  })
}

# ==================================================================
# RDS CLUSTERS
# ==================================================================
resource "aws_rds_cluster" "this" {
  for_each = local.rds_clusters_enabled

  cluster_identifier              = each.value.identifier
  engine                          = each.value.engine
  engine_version                  = each.value.engine_version
  master_username                 = each.value.master_username
  manage_master_user_password     = try(each.value.manage_master_user_password, true)
  database_name                   = each.value.database_name
  port                            = each.value.port
  apply_immediately               = try(each.value.apply_immediately, false)
  backup_retention_period         = try(each.value.backup_retention_period, 7)
  preferred_backup_window         = try(each.value.backup_window, "03:00-06:00")
  preferred_maintenance_window    = try(each.value.maintenance_window, "Sun:00:00-Sun:03:00")
  deletion_protection             = try(each.value.deletion_protection, true)
  copy_tags_to_snapshot           = try(each.value.copy_tags_to_snapshot, true)
  storage_encrypted               = try(each.value.storage_encrypted, true)
  kms_key_id                      = try(each.value.kms_key_id, null)
  enable_http_endpoint            = try(each.value.enable_http_endpoint, false)
  db_subnet_group_name            = try(aws_db_subnet_group.rds_clusters[each.key].name, each.value.db_subnet_group_name)
  vpc_security_group_ids          = [aws_security_group.rds_clusters[each.key].id]
  db_cluster_parameter_group_name = try(aws_rds_cluster_parameter_group.custom[each.key].name, each.value.db_cluster_parameter_group_name, null)

  dynamic "serverlessv2_scaling_configuration" {
    for_each = try(each.value.serverlessv2_scaling_configuration, null) == null ? [] : [each.value.serverlessv2_scaling_configuration]
    content {
      min_capacity = serverlessv2_scaling_configuration.value.min_capacity
      max_capacity = serverlessv2_scaling_configuration.value.max_capacity
    }
  }

  tags = merge(local.aws_default_tags, try(each.value.tags, {}), {
    Name = each.value.identifier
  })
}

# ==================================================================
# RDS CLUSTER INSTANCES
# ==================================================================
resource "aws_rds_cluster_instance" "this" {
  for_each = local.rds_cluster_instances

  identifier                   = each.value.identifier
  cluster_identifier           = aws_rds_cluster.this[each.value.cluster_key].id
  engine                       = aws_rds_cluster.this[each.value.cluster_key].engine
  engine_version               = aws_rds_cluster.this[each.value.cluster_key].engine_version
  instance_class               = each.value.instance_class
  publicly_accessible          = try(each.value.publicly_accessible, false)
  promotion_tier               = try(each.value.promotion_tier, null)
  apply_immediately            = try(each.value.apply_immediately, false)
  preferred_maintenance_window = try(each.value.maintenance_window, null)
  db_parameter_group_name = try(
    aws_db_parameter_group.custom[each.value.cluster_key].name,
    local.rds_clusters_enabled[each.value.cluster_key].db_parameter_group_name,
    null
  )
  monitoring_interval                   = try(each.value.monitoring_interval, 0)
  monitoring_role_arn                   = try(each.value.monitoring_role_arn, null)
  performance_insights_enabled          = try(each.value.performance_insights.enabled, false)
  performance_insights_retention_period = try(each.value.performance_insights.retention_period, null)
  performance_insights_kms_key_id       = try(each.value.performance_insights.kms_key_id, null)

  tags = merge(local.aws_default_tags, try(local.rds_clusters_enabled[each.value.cluster_key].tags, {}), {
    Name = each.value.identifier
  })
}
