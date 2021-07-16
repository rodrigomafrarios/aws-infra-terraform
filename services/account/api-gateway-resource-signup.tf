resource "aws_api_gateway_resource" "signup" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  parent_id   = aws_api_gateway_rest_api.this.root_resource_id
  path_part   = "signup"
}

module "api_gateway_signup" {
  source        = "../../api_gateway_lambda"
  account_id    = var.account_id
  region        = var.region
  rest_api_id   = aws_api_gateway_rest_api.this.id
  resource_id   = aws_api_gateway_resource.signup.id
  http_method   = "POST"
  lambda_arn    = module.signup_lambda.invoke_arn
}