module "s3_upload_thumbnail_bucket" {
  source = "../../s3"
  bucket_name = "${terraform.workspace}-${var.account_id}-${var.project}-uploaded-thumbnails"
}

resource "aws_ssm_parameter" "create_thumbnail_bucket" {
  name      = "${terraform.workspace}-create-thumbnail-bucket"
  type      = "String"
  value     = "${terraform.workspace}-uploaded-thumbnails"
  overwrite = true
}
