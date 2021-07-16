resource "null_resource" "lambda_deployment_bucket_arn_depends_on" {
  triggers = {
    dependency = var.lambda_deployment_bucket_arn
  }
}

resource "aws_lambda_layer_version" "latest" {
  layer_name = "latest-layer"
  description = "latest"
  filename      = "${path.module}/layer.zip"
  compatible_runtimes = [ "nodejs14.x" ]
}