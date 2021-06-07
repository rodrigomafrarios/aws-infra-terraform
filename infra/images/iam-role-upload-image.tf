resource "aws_iam_role" "upload_image_iam_role" {
  name               = "${var.env}-upload-image-iam-role"
  assume_role_policy = templatefile("${path.module}/templates/lambda-base-policy.tpl", {})
}

resource "aws_ssm_parameter" "upload_image_iam_role" {
  name      = "${var.env}-upload-image-iam-role"
  type      = "String"
  value     = aws_iam_role.upload_image_iam_role.arn
  overwrite = true
}
