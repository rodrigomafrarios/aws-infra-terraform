resource "aws_ssm_parameter" "dynamodb-accounts-table" {
  name  = "${var.env}-accounts"
  type  = "String"
  value = aws_dynamodb_table.accounts.name
}
