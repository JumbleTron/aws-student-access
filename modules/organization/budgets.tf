resource "aws_budgets_budget" "student" {
  for_each = aws_organizations_account.students

  name         = "budget-${each.key}"
  budget_type = "COST"
  limit_amount = var.student_budget_usd
  limit_unit   = "USD"
  time_unit    = "MONTHLY"

  cost_filter {
    name   = "LinkedAccount"
    values = [each.value.id]
  }

  notification {
    comparison_operator = "GREATER_THAN"
    threshold           = 80
    threshold_type      = "PERCENTAGE"
    notification_type   = "ACTUAL"

    subscriber_email_addresses = ["grzegorz.kielar@kielniakodu.com"]
  }
}