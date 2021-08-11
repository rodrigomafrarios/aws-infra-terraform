module "s3_image_bucket" {
  source = "../../s3"
  bucket_name = "${terraform.workspace}-${var.account_id}-${var.project}-uploaded-images"
}

resource "aws_s3_bucket_notification" "create_thumbnail_notification" {
  bucket = module.s3_image_bucket.bucket_id

  lambda_function {
    lambda_function_arn = module.create_thumbnail_lambda.arn
    events              = ["s3:ObjectCreated:*"]
  }
}
