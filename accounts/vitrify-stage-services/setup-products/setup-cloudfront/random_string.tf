# ==================================================================
# RANDOM NAME FOR CLOUDFRONT
# ==================================================================
resource "random_string" "cdn_name" {
  length  = 14
  special = false
  lower   = false
}