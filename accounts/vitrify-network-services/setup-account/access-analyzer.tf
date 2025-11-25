# ==================================================================
# AWS ACCESS ANALYZER
# ==================================================================
resource "aws_accessanalyzer_analyzer" "default" {
  analyzer_name = "analyzer"
  type          = "ACCOUNT"
}
