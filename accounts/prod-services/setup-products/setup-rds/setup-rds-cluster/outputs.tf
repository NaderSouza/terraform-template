# ==================================================================
# OUTPUTS
# ==================================================================

output "rds_cluster_endpoints" {
  description = "Endpoints and ports for each managed RDS cluster"
  value = {
    for key, cluster in aws_rds_cluster.this :
    key => {
      arn             = cluster.arn
      id              = cluster.id
      endpoint        = cluster.endpoint
      reader_endpoint = cluster.reader_endpoint
      port            = cluster.port
    }
  }
}

output "rds_cluster_security_groups" {
  description = "Security group identifiers for each cluster"
  value = {
    for key, sg in aws_security_group.rds_clusters :
    key => {
      id   = sg.id
      name = sg.name
    }
  }
}

output "rds_cluster_instances" {
  description = "Instance level information for each cluster instance"
  value = {
    for key, instance in aws_rds_cluster_instance.this :
    key => {
      identifier     = instance.id
      endpoint       = instance.endpoint
      port           = instance.port
      instance_class = instance.instance_class
      aws_identifier = instance.db_instance_identifier
    }
  }
}
