resource "aws_iam_policy_attachment" "create-account-policy-attachment" {
  name       = "${terraform.workspace}-create-account-attachment"
  roles      = [aws_iam_role.create_account_iam_role.name]
  policy_arn = aws_iam_policy.create_account_policy.arn
}