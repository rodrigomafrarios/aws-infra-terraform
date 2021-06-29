resource "aws_dynamodb_table" "accounts" {
  name     = "${var.env}-accounts"
  hash_key = "email"
  attribute {
    name = "email"
    type = "S"
  }
  write_capacity   = var.write_capacity
  read_capacity    = var.read_capacity
  stream_enabled   = true
  stream_view_type = "NEW_IMAGE"
}

resource "aws_dynamodb_table_item" "sample_account" {
  table_name = aws_dynamodb_table.accounts.name
  hash_key   = aws_dynamodb_table.accounts.hash_key

  item = <<ITEM
  {
    "id": {"S": "${var.sample_id}"},
    "email": {"S": "${var.sample_email}"},
    "password": {"S": "${var.sample_password}"},
    "name": {"S": "${var.sample_name}"}
  }
  ITEM
}