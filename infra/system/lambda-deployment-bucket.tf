resource "aws_s3_bucket" "lambda_deployment_bucket" {
  bucket = "${var.env}-${var.account_id}-lambda-deployment-bucket"
  acl    = "private"
}