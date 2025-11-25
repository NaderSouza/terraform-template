# ==================================================================
# AWS REQUEST ON-DEMAND - Standard (A, C, D, H, I, M, R, T, Z)
# ==================================================================

resource "aws_servicequotas_service_quota" "on_demand_request" {
  quota_code   = "L-1216C47A"
  service_code = "ec2"
  value        = 1152
}

# ==================================================================
# AWS REQUEST SPOT - Standard (A, C, D, H, I, M, R, T, Z)
# ==================================================================

resource "aws_servicequotas_service_quota" "spot_request" {
  quota_code   = "L-34B43A08"
  service_code = "ec2"
  value        = 1152
}
