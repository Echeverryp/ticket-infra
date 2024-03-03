resource "aws_lambda_function" "lambda_sender_event" {
  depends_on    = [aws_s3_bucket.artifacts_bucket]
  filename      = data.archive_file.lambda_zip_inline.output_path
  function_name = "${var.layer}-${var.stack_id}-lambda-test"
  handler       = "dist/functions/function.handler"
  role          = aws_iam_role.lambda.arn
  timeout       = "30"
  memory_size   = "768"
  runtime       = "nodejs16.x"
  vpc_config {
    # Every subnet should be able to reach an EFS mount target in the same Availability Zone. Cross-AZ mounts are not permitted.
    subnet_ids         = [aws_subnet.private1.id,aws_subnet.private2.id,aws_subnet.private3.id]
    security_group_ids = [aws_security_group.sg.id]
  }
  environment {
    variables = {
      StackId = "${var.stack_id}"

    }
  }
}
