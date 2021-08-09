resource "aws_api_gateway_resource" "image" {
  rest_api_id = aws_api_gateway_rest_api.image.id
  parent_id   = aws_api_gateway_rest_api.image.root_resource_id
  path_part   = "image"
}

resource "aws_api_gateway_method" "post_image" {
  authorization = "NONE"
  http_method   = "POST"
  resource_id   = aws_api_gateway_resource.image.id
  rest_api_id   = aws_api_gateway_rest_api.image.id

  depends_on = [
    aws_api_gateway_resource.image
  ]
}

resource "aws_api_gateway_integration" "integration_image" {
  rest_api_id             = aws_api_gateway_rest_api.image.id
  resource_id             = aws_api_gateway_resource.image.id
  http_method             = aws_api_gateway_method.post_image.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = module.upload_image_lambda.lambda_invoke_arn
}