resource "null_resource" "lambda_deployment_bucket_arn_depends_on" {
  triggers = {
    dependency = module.s3_deployment_account_bucket.bucket_arn
  }
}

resource "aws_lambda_layer_version" "latest" {
  layer_name          = "latest-layer"
  description         = "latest"
  s3_bucket           = "${terraform.workspace}-${var.account_id}-${var.project}-deployment" 
  s3_key              = "deploy/signup/layer.zip"
  compatible_runtimes = ["nodejs14.x"]
}