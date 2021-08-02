module "signup_lambda_permission" {
  source = "../../lambda_permission"
  apigateway_arn = aws_api_gateway_rest_api.account.execution_arn
  function_name = "${terraform.workspace}-signup"
  function_arn = module.account_signup_lambda.lambda_invoke_arn
  function_path = aws_api_gateway_resource.signup.path_part
  function_method = aws_api_gateway_method.post_signup.http_method
}

resource "aws_lambda_permission" "allow_bucket_signup" {
  statement_id  = "AllowExecutionFromS3BucketSignup"
  action        = "lambda:InvokeFunction"
  function_name = module.account_signup_lambda.arn
  principal     = "s3.amazonaws.com"
  source_arn    = module.s3_deployment_account_bucket.bucket_arn
}