module "upload_image_lambda_permission" {
  source = "../../lambda_permission"
  apigateway_arn = aws_api_gateway_rest_api.image.execution_arn
  function_name = "${terraform.workspace}-upload-image"
  function_arn = module.upload_image_lambda.lambda_invoke_arn
  function_path = aws_api_gateway_resource.image.path_part
  function_method = aws_api_gateway_method.post_image.http_method
}

resource "aws_lambda_permission" "allow_bucket_image" {
  statement_id  = "AllowExecutionFromS3BucketImageDeployment"
  action        = "lambda:InvokeFunction"
  function_name = module.upload_image_lambda.arn
  principal     = "s3.amazonaws.com"
  source_arn    = module.s3_deployment_image_bucket.bucket_arn
}