resource "aws_iam_policy" "upload_image_policy" {
  name = "${terraform.workspace}-upload-image-policy"
  policy = templatefile(format("%s/templates/s3-policy.tpl", path.module), {
    actions  = jsonencode([for action in var.images_bucket_actions : action]),
    resource = "*"
  })
}
