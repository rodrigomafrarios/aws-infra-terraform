resource "aws_iam_policy" "list_accounts_policy" {
  name = "${var.env}-list-accounts-policy"
  policy = templatefile("${path.module}/templates/dynamodb-policy.tpl", {
    actions  = jsonencode([for action in var.dynamodb_login_actions : action]),
    resource = "arn:aws:dynamodb:${var.region}:${var.account_id}:table/${var.env}-accounts"
  })
}