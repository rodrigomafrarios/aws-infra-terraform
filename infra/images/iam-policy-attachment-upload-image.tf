resource "aws_iam_policy_attachment" "upload-image-policy-attachment" {
  name       = "${var.env}-upload-image-attachment"
  roles      = [aws_iam_role.upload_image_iam_role.name]
  policy_arn = aws_iam_policy.upload_image_policy.arn
}
