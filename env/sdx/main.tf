data "aws_caller_identity" "current" {}

module "global_variables" {
  source = "../../global_variables"
}

module "system" {
  source            = "../../services/system"
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

module "account" {
  source                       = "../../services/account"
  account_id                   = module.global_variables.account_id
  dynamodb_table_accounts_name = module.system.dynamodb_table_accounts_name
  dynamodb_signup_actions      = var.dynamodb_signup_actions
  dynamodb_login_actions       = var.dynamodb_login_actions
  sample_jwt_secret            = var.sample_jwt_secret
}

module "images" {
  source         = "../../services/images"
  bucket_actions = var.bucket_actions
}

module "thumbnails" {
  source                    = "../../services/thumbnails"
  thumbnails_bucket_actions = var.thumbnails_bucket_actions
  image_bucket              = var.image_bucket
  thumbnail_bucket          = var.thumbnail_bucket
}
