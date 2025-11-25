# ==================================================================
# AWS DYNAMODB - TERRAFORM REMOTE STATE LOCK
# ==================================================================

resource "aws_dynamodb_table" "terraform" {
  name         = "${local.aws_account_id}-tf-remote-state1-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  server_side_encryption {
    enabled     = true
    kms_key_arn = module.kms_dynamodb.key_arn
  }

  point_in_time_recovery {
    enabled = true
  }

  lifecycle {
    ignore_changes = [
      read_capacity,
      write_capacity,
    ]
  }
}
