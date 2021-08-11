module "create_thumbnail_lambda_permission" {
  source = "../../lambda_permission"
  apigateway_arn = aws_api_gateway_rest_api.image.execution_arn
  function_name = "${terraform.workspace}-create-thumbnail"
  function_arn = module.create_thumbnail_lambda.lambda_invoke_arn
  function_path = aws_api_gateway_resource.thumbnail.path_part
  function_method = aws_api_gateway_method.post_thumbnail.http_method
}

# allow bucket to update create-thumbnail lambda
resource "aws_lambda_permission" "allow_bucket_thumbnail_deployment" {
  statement_id  = "AllowExecutionFromS3BucketThumbnailDeployment"
  action        = "lambda:InvokeFunction"
  function_name = module.create_thumbnail_lambda.arn
  principal     = "s3.amazonaws.com"
  source_arn    = module.s3_deployment_image_bucket.bucket_arn
}

# allow bucket to invoke create-thumbnail lambda
resource "aws_lambda_permission" "allow_bucket_thumbnail_lambda" {
  statement_id  = "AllowExecutionFromS3BucketThumbnail"
  action        = "lambda:InvokeFunction"
  function_name = module.create_thumbnail_lambda.arn
  principal     = "s3.amazonaws.com"
  source_arn    = module.s3_image_bucket.bucket_arn
}