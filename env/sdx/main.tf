data "aws_caller_identity" "sdx" {}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    random = {
      source = "hashicorp/random"
    }
  }

  backend "remote" {
   organization = "sdx-mafra"

    workspaces {
      name = "github-actions-sdx"
    }
  }
}

module "login" {
  source                 = "../../infra/login"
  env                    = var.env
  region                 = var.region
  dynamodb_login_actions = var.dynamodb_login_actions
  account_id             = var.account_id
}

module "signup" {
  source                  = "../../infra/signup"
  env                     = var.env
  region                  = var.region
  dynamodb_signup_actions = var.dynamodb_signup_actions
  account_id              = var.account_id
  sample_jwt_secret       = var.sample_jwt_secret
}

module "images" {
  source         = "../../infra/images"
  env            = var.env
  region         = var.region
  bucket_actions = var.bucket_actions
}

module "thumbnails" {
  source                    = "../../infra/thumbnails"
  env                       = var.env
  region                    = var.region
  thumbnails_bucket_actions = var.thumbnails_bucket_actions
  image_bucket              = var.image_bucket
  thumbnail_bucket          = var.thumbnail_bucket
}

module "system" {
  source            = "../../infra/system"
  env               = var.env
  region            = var.region
  account_id        = var.account_id
  read_capacity     = 5
  write_capacity    = 5
  sample_id         = var.sample_id
  sample_email      = var.sample_email
  sample_password   = var.sample_password
  sample_name       = var.sample_name
  sample_jwt_secret = var.sample_jwt_secret
  authorizer_fn     = var.authorizer_fn
}