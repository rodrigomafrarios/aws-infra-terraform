module "login_lambda" {
  source = "../../lambda"
  name = "login"
  function_name = "account-login"
  account_id = var.account_id
  project = var.project
  iam_role_arn = aws_iam_role.list_accounts_iam_role.arn
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
