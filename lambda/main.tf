resource "aws_lambda_function" "main" {
  function_name = "${terraform.workspace}-${var.name}"
  handler       = "api/main/lambdas/${var.name}/main.handler"
  runtime       = var.runtime
  role          = var.iam_role_arn
  s3_bucket     = var.s3_bucket_name
  s3_key        = var.s3_key
  memory_size   = var.memory_size
  timeout       = var.timeout
  source_code_hash  = "${base64sha256(timestamp())}"

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

  layers = [for layer in var.layers : layer]

  # vpc configs
}
