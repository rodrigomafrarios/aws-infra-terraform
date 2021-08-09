resource "aws_api_gateway_rest_api" "image" {
  name               = format("%s-api-image", terraform.workspace)
  binary_media_types = ["*/*"]
}

resource "aws_api_gateway_deployment" "image" {
  rest_api_id = aws_api_gateway_rest_api.image.id
  stage_name  = terraform.workspace

  depends_on = [
    aws_api_gateway_method.post_image,
    aws_api_gateway_method.post_thumbnail,
    aws_api_gateway_integration.integration_image,
    aws_api_gateway_integration.integration_thumbnail
  ]
}
