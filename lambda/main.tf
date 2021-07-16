resource "aws_lambda_function" "main" {
  function_name = "${terraform.workspace}-${var.function_name}"
  handler       = "api/main/lambdas/${var.name}/main.handler"
  runtime       = var.runtime
  role          = var.iam_role_arn
  filename      = "../../services/${var.project}/latest.zip"
  memory_size   = var.memory_size
  timeout       = var.timeout

  tags = {
    "Name" = var.project
  }

  environment {
    variables = merge(var.environment_variables, {
      APPLICATION : var.project,
      SERVICE : var.name,
      STAGE : terraform.workspace,
    })
  }

  depends_on = [var.resource_depends_on]

  layers = [ for layer in var.layers: layer ]

  # vpc configs
}
