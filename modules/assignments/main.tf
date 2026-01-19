resource "aws_ssoadmin_account_assignment" "students_lab" {
  instance_arn       = var.sso_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.lab_write.arn

  principal_id   = aws_identitystore_group.lab_students.group_id
  principal_type = "GROUP"

  target_id   = var.account_id
  target_type = "AWS_ACCOUNT"
}