resource "aws_iam_policy" "create_thumbnail_policy" {
  name = "${terraform.workspace}-create-thumbnail-policy"
  policy = templatefile(format("%s/templates/s3-policy.tpl", path.module), {
    actions = jsonencode([for action in var.thumbnails_bucket_actions : action]),
    resource = "*"
  })
}

# jsonencode([for arn in [module.s3_image_bucket.bucket_arn, module.s3_thumbnail_bucket.bucket_arn] : arn])
