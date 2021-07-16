resource "aws_s3_bucket" "lambda_deployment_bucket" {
  bucket = "${terraform.workspace}-${var.account_id}-lambda-deployment-bucket"
  acl    = "private"
}