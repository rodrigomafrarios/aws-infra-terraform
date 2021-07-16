resource "aws_api_gateway_rest_api" "this" {
  name = format("%s-api-account", terraform.workspace)
  binary_media_types = ["*/*"]
}

resource "aws_api_gateway_deployment" "this" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  stage_name  = terraform.workspace

  stage_description = "Deploy em ${timestamp()}"
}

resource "aws_api_gateway_stage" "this" {
  stage_name    = terraform.workspace
  rest_api_id   = aws_api_gateway_rest_api.this.id
  deployment_id = aws_api_gateway_deployment.this.id
}
