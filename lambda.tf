resource "aws_lambda_function" "lambda_secure_headers_event" {
  filename      = data.archive_file.lambda_zip_inline.output_path
  function_name = "${var.layer}-${var.stack_id}-lambda-headers"
  handler       = "dist/functions/function.handler"
  role          = aws_iam_role.lambda.arn
  timeout       = "5"
  memory_size   = "128"
  runtime       = "nodejs16.x"
  publish = true
}
