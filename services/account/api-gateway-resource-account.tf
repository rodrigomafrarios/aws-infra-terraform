resource "aws_api_gateway_resource" "account" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  parent_id   = aws_api_gateway_rest_api.this.root_resource_id
  path_part   = "{proxy+}"
}

resource "aws_api_gateway_method" "account" {
  rest_api_id   = aws_api_gateway_rest_api.this.id
  resource_id   = aws_api_gateway_resource.account.id
  http_method   = "ANY"
  authorization = "NONE"
}

module "api_gateway_account" {
  source        = "../../api_gateway_lambda"
  account_id    = var.account_id
  region        = var.region
  rest_api_id   = aws_api_gateway_rest_api.this.id
  resource_id   = aws_api_gateway_resource.account.id
  http_method   = "POST"
  lambda_arn    = module.login_lambda.invoke_arn
}