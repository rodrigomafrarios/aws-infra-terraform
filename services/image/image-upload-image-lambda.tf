module "upload_image_lambda" {
  source        = "../../lambda"
  name          = "upload-image"
  s3_bucket_name = "${terraform.workspace}-${var.account_id}-${var.project}-deployment"
  s3_key        = "deploy/upload-image/latest.zip"
  account_id    = var.account_id
  project       = var.project
  iam_role_arn  = aws_iam_role.upload_image_iam_role.arn
  layers        = [aws_lambda_layer_version.latest.arn]
  environment_variables = {
    "IMAGE_BUCKET" : "${terraform.workspace}-${var.account_id}-${var.project}-uploaded-images"
  }
  resource_depends_on = [
    null_resource.lambda_deployment_bucket_arn_depends_on
  ]
  aws_api_gateway_rest_api_id  = aws_api_gateway_rest_api.image.id
}
