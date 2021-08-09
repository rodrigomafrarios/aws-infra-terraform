resource "aws_iam_policy_attachment" "create-thumbnail-policy-attachment" {
  name       = "${terraform.workspace}-create-thumbnail-attachment"
  roles      = [aws_iam_role.create_thumbnail_iam_role.name]
  policy_arn = aws_iam_policy.create_thumbnail_policy.arn
}
