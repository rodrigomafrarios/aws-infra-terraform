data "aws_caller_identity" "current" {}

module "system" {
  source            = "./system"
  account_id        = module.global_variables.account_id
  read_capacity     = 5
  write_capacity    = 5
  sample_id         = var.sample_id
  sample_email      = var.sample_email
  sample_password   = var.sample_password
  sample_name       = var.sample_name
  sample_jwt_secret = var.sample_jwt_secret
  authorizer_fn     = var.authorizer_fn
}

module "login" {
  source                 = "./login"
  dynamodb_login_actions = var.dynamodb_login_actions
  account_id             = module.global_variables.account_id
}

module "signup" {
  source                  = "./signup"
  memory_size             = 512
  timeout                 = 3
  dynamodb_signup_actions = var.dynamodb_signup_actions
  account_id              = module.global_variables.account_id
  sample_jwt_secret       = var.sample_jwt_secret
  lambda_deployment_bucket_arn = module.system.lambda_deployment_bucket_arn
}

module "images" {
  source         = "./images"
  bucket_actions = var.bucket_actions
}

module "thumbnails" {
  source                    = "./thumbnails"
  thumbnails_bucket_actions = var.thumbnails_bucket_actions
  image_bucket              = var.image_bucket
  thumbnail_bucket          = var.thumbnail_bucket
}
