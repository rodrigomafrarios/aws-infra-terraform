resource "aws_ssm_parameter" "dynamodb-accounts-table" {
  name  = "${terraform.workspace}-accounts"
  type  = "String"
  value = aws_dynamodb_table.accounts.name
}
