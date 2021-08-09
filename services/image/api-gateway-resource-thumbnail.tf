resource "aws_api_gateway_resource" "thumbnail" {
  rest_api_id = aws_api_gateway_rest_api.thumbnail.id
  parent_id   = aws_api_gateway_rest_api.thumbnail.root_resource_id
  path_part   = "thumbnail"
}

resource "aws_api_gateway_method" "post_thumbnail" {
  authorization = "NONE"
  http_method   = "POST"
  resource_id   = aws_api_gateway_resource.thumbnail.id
  rest_api_id   = aws_api_gateway_rest_api.thumbnail.id

  depends_on = [
    aws_api_gateway_resource.thumbnail
  ]
}

resource "aws_api_gateway_integration" "integration_thumbnail" {
  rest_api_id             = aws_api_gateway_rest_api.thumbnail.id
  resource_id             = aws_api_gateway_resource.thumbnail.id
  http_method             = aws_api_gateway_method.post_thumbnail.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = module.create_thumbnail_lambda.lambda_invoke_arn
}