resource "aws_ssm_parameter" "authorizer-arn" {
  name      = "${var.env}-authorizer-arn"
  type      = "String"
  value     = "arn:aws:lambda:${var.region}:${var.account_id}:function:${var.authorizer_fn}-${var.env}-authorizer"
  overwrite = true
}