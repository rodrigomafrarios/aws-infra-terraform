module "login_lambda_permission" {
  source = "../../lambda_permission"
  apigateway_arn = aws_api_gateway_rest_api.account.execution_arn
  function_name = "${terraform.workspace}-login"
  function_arn = module.account_login_lambda.lambda_invoke_arn
  function_path = aws_api_gateway_resource.login.path_part
  function_method = aws_api_gateway_method.post_login.http_method
}

resource "aws_lambda_permission" "allow_bucket_login" {
  statement_id  = "AllowExecutionFromS3BucketLogin"
  action        = "lambda:InvokeFunction"
  function_name = module.account_login_lambda.arn
  principal     = "s3.amazonaws.com"
  source_arn    = module.s3_deployment_account_bucket.bucket_arn
}