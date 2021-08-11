module "s3_thumbnail_bucket" {
  source = "../../s3"
  bucket_name = "${terraform.workspace}-${var.account_id}-${var.project}-uploaded-thumbnails"
}
