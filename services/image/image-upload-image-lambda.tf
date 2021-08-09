module "upload_image_lambda" {
  source        = "../../lambda"
  name          = "create-thumbnail"
  s3_bucket_name = s3_deployment_image_bucket.bucket_name
  s3_key        = "deploy/thumbnail/latest.zip"
  account_id    = var.account_id
  project       = var.project
  iam_role_arn  = aws_iam_role.create_thumbnail_iam_role.arn
  layers        = [aws_lambda_layer_version.latest.arn]
  environment_variables = {
    "THUMBNAIL_BUCKET" : s3_upload_thumbnail_bucket.bucket_name
  }
  resource_depends_on = [
    null_resource.lambda_deployment_bucket_arn_depends_on
  ]
  aws_api_gateway_rest_api_id  = aws_api_gateway_rest_api.image.id
}
