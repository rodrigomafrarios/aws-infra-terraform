resource "aws_s3_bucket" "upload_image" {
  bucket = "${terraform.workspace}-uploaded-images"
  acl    = "private"
}

resource "aws_ssm_parameter" "upload_image_bucket" {
  name      = "${terraform.workspace}-upload-image-bucket"
  type      = "String"
  value     = "${terraform.workspace}-uploaded-images"
  overwrite = true
}