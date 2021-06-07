resource "aws_iam_role" "create_account_iam_role" {
  name = "${var.env}-create-account-iam-role"
  assume_role_policy = templatefile("${path.module}/templates/lambda-base-policy.tpl", {})
}

resource "aws_ssm_parameter" "create_account_iam_role" {
  name = "${var.env}-create-account-iam-role"
  type = "String"
  value = aws_iam_role.create_account_iam_role.arn
  overwrite = true
}
