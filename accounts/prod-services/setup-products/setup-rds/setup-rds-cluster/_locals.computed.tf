locals {
  rds_clusters_enabled = {
    for key, cfg in local.rds_clusters :
    key => cfg
    if try(cfg.enabled, true)
  }

  rds_cluster_instances = length(local.rds_clusters_enabled) == 0 ? {} : merge([
    for cluster_key, cluster in local.rds_clusters_enabled :
    {
      for instance_key, instance in cluster.instances :
      "${cluster_key}-${instance_key}" => merge(instance, {
        cluster_key    = cluster_key
        instance_key   = instance_key
        identifier     = "${cluster.identifier}-${instance_key}"
        instance_class = try(instance.instance_class, "db.r6g.large")
      })
    }
  ]...)
}
