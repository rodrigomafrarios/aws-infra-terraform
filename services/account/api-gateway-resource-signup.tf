resource "aws_api_gateway_resource" "signup" {
  rest_api_id = aws_api_gateway_rest_api.account.id
  parent_id   = aws_api_gateway_rest_api.account.root_resource_id
  path_part   = "signup"
}

resource "aws_api_gateway_method" "post_signup" {
  authorization = "NONE"
  http_method   = "POST"
  resource_id   = aws_api_gateway_resource.signup.id
  rest_api_id   = aws_api_gateway_rest_api.account.id

  depends_on = [
    aws_api_gateway_resource.signup
  ]
}

resource "aws_api_gateway_integration" "integration_signup" {
  rest_api_id             = aws_api_gateway_rest_api.account.id
  resource_id             = aws_api_gateway_resource.signup.id
  http_method             = aws_api_gateway_method.post_signup.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = module.account_signup_lambda.lambda_invoke_arn
}
