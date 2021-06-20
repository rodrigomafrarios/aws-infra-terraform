resource "aws_iam_role" "create_thumbnail_iam_role" {
  name               = "${var.env}-create-thumbnail-iam-role"
  assume_role_policy = templatefile("${path.module}/templates/lambda-base-policy.tpl", {})
}

resource "aws_ssm_parameter" "create_thumbnail_iam_role" {
  name      = "${var.env}-create-thumbnail-iam-role"
  type      = "String"
  value     = aws_iam_role.create_thumbnail_iam_role.arn
  overwrite = true
}
