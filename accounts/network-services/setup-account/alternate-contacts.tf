# ==================================================================
# AWS ALTERNATE CONTACTS
# ==================================================================
resource "aws_account_alternate_contact" "billing" {
  count                  = local.contact_billing == null ? 0 : 1
  alternate_contact_type = "BILLING"
  email_address          = local.contact_billing.email_address
  name                   = local.contact_billing.name
  phone_number           = local.contact_billing.phone_number
  title                  = "Billing Team"
}

resource "aws_account_alternate_contact" "operation" {
  count                  = local.contact_operations == null ? 0 : 1
  alternate_contact_type = "OPERATIONS"
  email_address          = local.contact_operations.email_address
  name                   = local.contact_operations.name
  phone_number           = local.contact_operations.phone_number
  title                  = "Operations Team"
}

resource "aws_account_alternate_contact" "security" {
  count                  = local.contact_security == null ? 0 : 1
  alternate_contact_type = "SECURITY"
  email_address          = local.contact_security.email_address
  name                   = local.contact_security.name
  phone_number           = local.contact_security.phone_number
  title                  = "Security Team"
}
