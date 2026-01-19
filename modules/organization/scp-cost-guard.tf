resource "aws_organizations_policy" "deny_expensive" {
  name = "DenyExpensiveInstances"
  type = "SERVICE_CONTROL_POLICY"

  content = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Deny"
      Action = "ec2:RunInstances"
      Resource = "*"
      Condition = {
        StringNotEquals = {
          "ec2:InstanceType" = ["t3.micro", "t3.small"]
        }
      }
    }]
  })
}

resource "aws_organizations_policy_attachment" "deny_expensive_attach" {
  policy_id = aws_organizations_policy.deny_expensive.id
  target_id = aws_organizations_organizational_unit.students.id
}