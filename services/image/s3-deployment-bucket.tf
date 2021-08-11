module "s3_deployment_image_bucket" {
  source = "../../s3"
  bucket_name = "${terraform.workspace}-${var.account_id}-${var.project}-deployment"
}

resource "aws_s3_bucket_object" "thumbnail" {
  bucket = module.s3_deployment_image_bucket.bucket_id
  key = "deploy/create-thumbnail/"
  source = "/dev/null"
}

resource "aws_s3_bucket_object" "image" {
  bucket = module.s3_deployment_image_bucket.bucket_id
  key = "deploy/upload-image/"
  source = "/dev/null"
}
