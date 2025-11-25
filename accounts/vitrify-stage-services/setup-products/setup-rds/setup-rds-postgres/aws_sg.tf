# ===============================================
# Security Group for RDS PostgreSQL
# ===============================================
resource "aws_security_group" "rds_postgres" {
  name        = "${local.aws_environment}-rds-sg"
  description = "Security Group for RDS PostgreSQL"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.164.16.0/20"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = local.aws_default_tags
}
