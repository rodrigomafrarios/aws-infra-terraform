module "signup_lambda" {
  source = "../../lambda"
  name = "signup"
  function_name = "account-signup"
  account_id = var.account_id
  project = var.project
  iam_role_arn = aws_iam_role.create_account_iam_role.arn
  memory_size = 512
  timeout = 3
  layers = [ aws_lambda_layer_version.latest.arn ]
  environment_variables = {
    "DYNAMODB_TABLE_ACCOUNTS": var.dynamodb_table_accounts_name,
    "JWT_SECRET": var.sample_jwt_secret
  }
  resource_depends_on = [
    null_resource.lambda_deployment_bucket_arn_depends_on
  ]
  aws_api_gateway_rest_api_id = aws_api_gateway_rest_api.this.id
}
