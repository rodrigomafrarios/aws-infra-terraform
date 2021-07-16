module "login_lambda_permission" {
  source = "../../lambda_permission"
  account_id = var.account_id
  rest_api_id = aws_api_gateway_rest_api.this.id
  function_name = "${terraform.workspace}-account"
}