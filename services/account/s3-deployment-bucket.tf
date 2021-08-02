module "s3_deployment_account_bucket" {
  source = "../../s3"
  bucket_name = "${terraform.workspace}-${var.account_id}-${var.project}-deployment"
}

resource "aws_s3_bucket_object" "signup" {
  bucket = module.s3_deployment_account_bucket.bucket_id
  key = "deploy/signup/"
  source = "/dev/null"
}

resource "aws_s3_bucket_object" "login" {
  bucket = module.s3_deployment_account_bucket.bucket_id
  key = "deploy/login/"
  source = "/dev/null"
}
