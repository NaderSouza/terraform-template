# ==================================================================
# SECURITY GROUPS FOR RDS CLUSTERS
# ==================================================================
resource "aws_security_group" "rds_clusters" {
  for_each = local.rds_clusters_enabled

  name        = "${each.value.identifier}-sg"
  description = "Security group for ${each.value.description}"
  vpc_id      = data.aws_vpc.selected.id

  dynamic "ingress" {
    for_each = try(each.value.allowed_cidr_blocks, ["10.0.0.0/8"])
    content {
      from_port   = each.value.port
      to_port     = each.value.port
      protocol    = "tcp"
      cidr_blocks = [ingress.value]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.aws_default_tags, try(each.value.tags, {}), {
    Name = "${each.value.identifier}-sg"
  })
}
