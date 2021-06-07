resource "aws_ssm_parameter" "jwt_secret" {
  name = "${var.env}-jwt-secret"
  type = "String"
  value = var.sample_jwt_secret
}