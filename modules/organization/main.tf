data "aws_organizations_organization" "org" {}

resource "aws_organizations_organizational_unit" "students" {
  name      = "students"
  parent_id = data.aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_account" "students" {
  for_each = { for s in var.students : s.username => s }
  name      = "student-${each.key}"
  email     = each.value.email
  parent_id = aws_organizations_organizational_unit.students.id
  role_name = "OrganizationAccountAccessRole"

  # Zapobiega pozostawianiu "osieroconych" kont po usunięciu studenta z listy
  close_on_deletion = true

  # Opcjonalnie, jeśli chcesz mieć dostęp do billingów z poziomu IAM
  iam_user_access_to_billing = "ALLOW"
}