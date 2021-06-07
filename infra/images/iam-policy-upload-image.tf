resource "aws_iam_policy" "upload_image_policy" {
  name = "${var.env}-upload-image-policy"
  policy = templatefile(format("%s/templates/s3-policy.tpl", path.module), {
    actions = jsonencode([for action in var.bucket_actions : action]),
    resource = format("%s/*", aws_s3_bucket.upload_image.arn)
  })
}
