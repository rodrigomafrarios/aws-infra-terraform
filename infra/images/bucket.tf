resource "aws_s3_bucket" "upload_image" {
  bucket = "${var.env}-uploaded-images"
  acl    = "private"
}

resource "aws_ssm_parameter" "upload_image_bucket" {
  name      = "${var.env}-upload-image-bucket"
  type      = "String"
  value     = "${var.env}-uploaded-images"
  overwrite = true
}