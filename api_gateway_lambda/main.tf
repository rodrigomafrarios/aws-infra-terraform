resource "aws_api_gateway_method" "main" {
  rest_api_id          = var.rest_api_id
  resource_id          = var.resource_id
  http_method          = var.http_method
  authorization        = var.authorization
}

resource "aws_api_gateway_integration" "main" {
  rest_api_id             = var.rest_api_id
  resource_id             = var.resource_id
  http_method             = aws_api_gateway_method.main.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.lambda_arn
}
