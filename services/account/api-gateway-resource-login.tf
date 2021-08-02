resource "aws_api_gateway_resource" "login" {
  rest_api_id = aws_api_gateway_rest_api.account.id
  parent_id   = aws_api_gateway_rest_api.account.root_resource_id
  path_part   = "login"
}

resource "aws_api_gateway_method" "post_login" {
  authorization = "NONE"
  http_method   = "POST"
  resource_id   = aws_api_gateway_resource.login.id
  rest_api_id   = aws_api_gateway_rest_api.account.id

  depends_on = [
    aws_api_gateway_resource.login
  ]
}

resource "aws_api_gateway_integration" "integration_login" {
  rest_api_id             = aws_api_gateway_rest_api.account.id
  resource_id             = aws_api_gateway_resource.login.id
  http_method             = aws_api_gateway_method.post_login.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = module.account_login_lambda.lambda_invoke_arn
}