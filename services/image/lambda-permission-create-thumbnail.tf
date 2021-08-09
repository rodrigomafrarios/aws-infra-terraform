module "create_thumbnail_lambda_permission" {
  source = "../../lambda_permission"
  apigateway_arn = aws_api_gateway_rest_api.account.execution_arn
  function_name = "${terraform.workspace}-create-thumbnail"
  function_arn = module.create_thumbnail_lambda.lambda_invoke_arn
  function_path = aws_api_gateway_resource.thumbnail.path_part
  function_method = aws_api_gateway_method.post_thumbnail.http_method
}

resource "aws_lambda_permission" "allow_bucket_thumbnail" {
  statement_id  = "AllowExecutionFromS3BucketThumbnail"
  action        = "lambda:InvokeFunction"
  function_name = module.create_thumbnail_lambda.arn
  principal     = "s3.amazonaws.com"
  source_arn    = module.s3_upload_thumbnail_bucket.bucket_arn
}