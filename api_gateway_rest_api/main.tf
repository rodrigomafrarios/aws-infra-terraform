resource "aws_api_gateway_rest_api" "main" {
  name = format("%s-${var.name}", terraform.workspace)
  binary_media_types = ["*/*"]
}
