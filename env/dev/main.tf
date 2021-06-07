data "aws_caller_identity" "dev" {}

module "login" {
  source = "../../infra/login"
  env    = var.env
  region = var.region
  dynamodb_login_actions = var.dynamodb_login_actions
  account_id = var.account_id
}

module "signup" {
  source = "../../infra/signup"
  env    = var.env
  region = var.region
  dynamodb_signup_actions = var.dynamodb_signup_actions
  account_id = var.account_id
}

module "images" {
  source = "../../infra/images"
  env    = var.env
  region = var.region
  bucket_actions = var.bucket_actions
}

module "system" {
  source = "../../infra/system"
  env    = var.env
  read_capacity = 1
  write_capacity = 1
  sample_id = var.sample_id
  sample_email = var.sample_email
  sample_password = var.sample_password
  sample_name = var.sample_name
  sample_jwt_secret = var.sample_jwt_secret
  authorizer_fn = var.authorizer_fn
}