resource "aws_iam_role" "list_accounts_iam_role" {
  name               = "${terraform.workspace}-list-accounts-iam-role"
  assume_role_policy = templatefile("${path.module}/templates/lambda-base-policy.tpl", {})
}

resource "aws_ssm_parameter" "list_accounts_iam_role" {
  name      = "${terraform.workspace}-list-accounts-iam-role"
  type      = "String"
  value     = aws_iam_role.list_accounts_iam_role.arn
  overwrite = true
}
