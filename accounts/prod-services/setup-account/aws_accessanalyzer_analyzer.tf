# ==================================================================
# # AWS ACCESS ANALYZER - SA-EAST-1
# # ==================================================================

# resource "aws_accessanalyzer_analyzer" "sa_east_1" {
#   provider      = aws.sa-east-1
#   analyzer_name = "account-zone-of-trust"
#   type          = "ACCOUNT"
# }

# # ==================================================================
# AWS ACCESS ANALYZER - US-EAST-1
# ==================================================================

resource "aws_accessanalyzer_analyzer" "us_east_1" {
  provider      = aws.us-east-1
  analyzer_name = "account-zone-of-trust"
  type          = "ACCOUNT"
}
