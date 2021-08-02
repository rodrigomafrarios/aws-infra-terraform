resource "aws_lambda_permission" "main" {
  action        = "lambda:InvokeFunction"
  function_name = var.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn = "${var.apigateway_arn}/*/${var.function_method}/${var.function_path}"

  depends_on = [
    var.function_arn
  ]
}