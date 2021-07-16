resource "aws_ssm_parameter" "authorizer-arn" {
  name      = "${terraform.workspace}-authorizer-arn"
  type      = "String"
  value     = "arn:aws:lambda:${var.region}:${var.account_id}:function:${var.authorizer_fn}-${terraform.workspace}-authorizer"
  overwrite = true
}