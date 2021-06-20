resource "aws_s3_bucket" "create_thumbnail" {
  bucket = "${var.env}-uploaded-thumbnails"
  acl    = "private"
}

resource "aws_ssm_parameter" "create_thumbnail_bucket" {
  name      = "${var.env}-create-thumbnail-bucket"
  type      = "String"
  value     = "${var.env}-uploaded-thumbnails"
  overwrite = true
}