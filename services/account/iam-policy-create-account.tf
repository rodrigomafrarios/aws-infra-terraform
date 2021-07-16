resource "aws_iam_policy" "create_account_policy" {
  name = "${terraform.workspace}-create-account-policy"
  policy = templatefile("${path.module}/templates/dynamodb-policy.tpl", {
    actions  = jsonencode([for action in var.dynamodb_signup_actions : action]),
    resource = "arn:aws:dynamodb:${var.region}:${var.account_id}:table/${terraform.workspace}-accounts"
  })
}