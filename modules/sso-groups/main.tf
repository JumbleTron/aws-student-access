resource "aws_identitystore_group" "students" {
  identity_store_id = local.identity_store_id
  display_name      = "aws-students"
}

resource "aws_identitystore_group_membership" "members" {
  for_each = aws_identitystore_user.students

  identity_store_id = local.identity_store_id
  group_id          = aws_identitystore_group.students.group_id
  member_id         = each.value.user_id
}