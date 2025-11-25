# # ==================================================================
# # AWS ACCOUNT ALTERNATE CONTACT - BILLING
# # ==================================================================

# resource "aws_account_alternate_contact" "billing" {
#   count                  = local.aws_contact_billing == null ? 0 : 1
#   alternate_contact_type = "BILLING"
#   email_address          = local.aws_contact_billing.email_address
#   name                   = local.aws_contact_billing.name
#   phone_number           = local.aws_contact_billing.phone_number
#   title                  = "Billing Team"
# }

# # ==================================================================
# # AWS ACCOUNT ALTERNATE CONTACT - OPERATION
# # ==================================================================

# resource "aws_account_alternate_contact" "operation" {
#   count                  = local.aws_contact_operations == null ? 0 : 1
#   alternate_contact_type = "OPERATIONS"
#   email_address          = local.aws_contact_operations.email_address
#   name                   = local.aws_contact_operations.name
#   phone_number           = local.aws_contact_operations.phone_number
#   title                  = "Operations Team"
# }

# # ==================================================================
# # AWS ACCOUNT ALTERNATE CONTACT - SECURITY
# # ==================================================================

# resource "aws_account_alternate_contact" "security" {
#   count                  = local.aws_contact_security == null ? 0 : 1
#   alternate_contact_type = "SECURITY"
#   email_address          = local.aws_contact_security.email_address
#   name                   = local.aws_contact_security.name
#   phone_number           = local.aws_contact_security.phone_number
#   title                  = "Security Team"
# }
