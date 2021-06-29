resource "aws_lambda_function" "signup" {
  function_name = format("%s-accounts-signup", var.env)
  handler       = "api/main/lambdas/signup/main.handler"
  runtime       = "nodejs14.x"
  s3_bucket     = "${var.env}-${var.account_id}-lambda-deployment-bucket"
  s3_key        = "${var.env}-accounts-signup/latest.zip"
  role          = aws_iam_role.create_account_iam_role.arn

  environment {
    variables = {
      DYNAMODB_ACCOUNTS = "${var.env}-accounts",
      JWT_SECRET        = var.sample_jwt_secret
    }
  }

  tags = {
    Name = format("%s-accounts-signup", var.env)
  }
}

resource "aws_lambda_permission" "allowApiGatewayInvoke" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.signup.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "arn:aws:execute-api:${var.region}:${var.account_id}:${aws_api_gateway_rest_api.this.id}/*/*"
}