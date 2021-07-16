resource "aws_iam_policy_attachment" "list-accounts-policy-attachment" {
  name       = "${terraform.workspace}-list-accounts-attachment"
  roles      = [aws_iam_role.list_accounts_iam_role.name]
  policy_arn = aws_iam_policy.list_accounts_policy.arn
}