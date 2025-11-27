# ==================================================================
# # AWS EBS ECRYPTION BY DEFAULT - SA-EAST-1
# # ==================================================================

# resource "aws_ebs_encryption_by_default" "sa_east_1" {
#   provider = aws.sa-east-1
#   enabled  = true
# }

# ==================================================================
# AWS EBS ECRYPTION BY DEFAULT - US-EAST-1
# ==================================================================

resource "aws_ebs_encryption_by_default" "us_east_1" {
  provider = aws.us-east-1
  enabled  = true
}
