resource "aws_iam_policy" "create_thumbnail_policy" {
  name = "${terraform.workspace}-create-thumbnail-policy"
  policy = templatefile(format("%s/templates/s3-policy.tpl", path.module), {
    actions          = jsonencode([for action in var.thumbnails_bucket_actions : action])
    env              = terraform.workspace
    image_bucket     = var.image_bucket
    thumbnail_bucket = var.thumbnail_bucket
  })
}
