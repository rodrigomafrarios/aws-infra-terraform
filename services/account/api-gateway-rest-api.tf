resource "aws_api_gateway_rest_api" "account" {
  name               = format("%s-api-account", terraform.workspace)
  binary_media_types = ["*/*"]
}

resource "aws_api_gateway_deployment" "account" {
  rest_api_id = aws_api_gateway_rest_api.account.id
  stage_name  = terraform.workspace

  depends_on = [
    aws_api_gateway_method.post_login,
    aws_api_gateway_method.post_signup,
    aws_api_gateway_integration.integration_login,
    aws_api_gateway_integration.integration_signup
  ]
}
