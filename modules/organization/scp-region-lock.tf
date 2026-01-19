resource "aws_organizations_policy" "region_lock" {
  name = "DenyAllRegionsExceptEU"
  type = "SERVICE_CONTROL_POLICY"

  content = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Deny"
      Action   = "*"
      Resource = "*"
      Condition = {
        StringNotEquals = {
          "aws:RequestedRegion" = "eu-central-1"
        }
      }
    }]
  })
}

resource "aws_organizations_policy_attachment" "region_lock_attach" {
  policy_id = aws_organizations_policy.region_lock.id
  target_id = aws_organizations_organizational_unit.students.id
}