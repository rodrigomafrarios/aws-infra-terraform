output "lambda_deployment_bucket_arn" {
  value = aws_s3_bucket.lambda_deployment_bucket.arn
}

output "dynamodb_table_accounts_name" {
  value = aws_dynamodb_table.accounts.name
}