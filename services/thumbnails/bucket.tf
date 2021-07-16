resource "aws_s3_bucket" "create_thumbnail" {
  bucket = "${terraform.workspace}-uploaded-thumbnails"
  acl    = "private"
}

resource "aws_ssm_parameter" "create_thumbnail_bucket" {
  name      = "${terraform.workspace}-create-thumbnail-bucket"
  type      = "String"
  value     = "${terraform.workspace}-uploaded-thumbnails"
  overwrite = true
}