resource "aws_identitystore_user" "students" {
  for_each = { for s in var.students : s.username => s }

  identity_store_id = local.identity_store_id
  user_name         = each.value.username
  display_name      = each.value.name

  name {
    given_name  = split(" ", each.value.name)[0]
    family_name = split(" ", each.value.name)[1]
  }

  emails {
    value   = each.value.email
    primary = true
  }
}