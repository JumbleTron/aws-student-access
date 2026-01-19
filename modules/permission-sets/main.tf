resource "aws_ssoadmin_permission_set" "lab_write" {
  name             = "WebApp-LAB"
  instance_arn     = var.sso_instance_arn
  session_duration = "PT2H"
}

resource "aws_ssoadmin_permission_set_inline_policy" "lab_policy" {
  instance_arn       = var.sso_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.lab_write.arn

  inline_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = [
        "ec2:RunInstances",
        "ec2:TerminateInstances",
        "autoscaling:*",
        "elasticloadbalancing:*",
        "ecs:*",
        "cloudwatch:*"
      ],
      Resource = "*",
      Condition = {
        StringEquals = {
          "aws:RequestedRegion" = var.region
        }
      }
    }]
  })
}