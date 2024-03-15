resource "aws_iam_role" "task_role" {
  name               = "ecs-task-role"
  assume_role_policy = data.aws_iam_policy_document.ecs_task_assume_policy.json

  inline_policy {
    name = "ecs-task-permissions"
    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action = [
            "ecr:*",
            "logs:*",
            "ssm:*",
            "kms:Decrypt",
            "secretsmanager:GetSecretValue"

          ]
          Effect   = "Allow"
          Resource = "*"
        }
      ]
    })
  }
}