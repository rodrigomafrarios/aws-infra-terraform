module "account_login_lambda" {
  source        = "../../lambda"
  name          = "login"
  s3_bucket_name = "${terraform.workspace}-${var.account_id}-${var.project}-deployment"
  s3_key        = "deploy/login/latest.zip"
  account_id    = var.account_id
  project       = var.project
  iam_role_arn  = aws_iam_role.login_iam_role.arn
  layers        = [aws_lambda_layer_version.latest.arn]
  environment_variables = {
    "DYNAMODB_TABLE_ACCOUNTS" : var.dynamodb_table_accounts_name,
    "JWT_SECRET" : var.sample_jwt_secret
  }
  resource_depends_on = [
    null_resource.lambda_deployment_bucket_arn_depends_on
  ]
  aws_api_gateway_rest_api_id  = aws_api_gateway_rest_api.account.id
}
