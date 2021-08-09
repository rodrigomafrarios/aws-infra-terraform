module "s3_upload_image_bucket" {
  source = "../../s3"
  bucket_name = "${terraform.workspace}-${var.account_id}-${var.project}-uploaded-images"
}

resource "aws_ssm_parameter" "upload_image_bucket" {
  name      = "${terraform.workspace}-upload-image-bucket"
  type      = "String"
  value     = "${terraform.workspace}-uploaded-images"
  overwrite = true
}
