data "archive_file" "kp_logs_processor_handler_file" {
  type        = "zip"
  source_file = "kp-logs-processor.py"
  output_path = "outputs/kp-logs-processor.zip"
}

resource "aws_lambda_function" "kp_logs_processor_handler" {
  filename      = "outputs/kp-logs-processor.zip"
  function_name = var.kp_logs_processor_function_name
  handler       = var.kp_logs_processor_handler


  source_code_hash = filebase64sha256("outputs/kp-logs-processor.zip")

  role          = aws_iam_role.kp_logs_processor_lambda_role.arn
  runtime       = var.kp_logs_processor_runtime
  timeout       = var.kp_logs_processor_timeout
  package_type  = var.kp_logs_processor_package_type
  memory_size   = var.kp_logs_processor_memory
  description   = var.kp_logs_processor_description
  tags          = var.common_tags
  environment   {
    variables = {
      S3_INGESTION_LOGS = var.kp_logs_bucket_name
      S3_TRANSFORMATION_LOGS = var.kp_transformation_logs_bucket_name
    }
  }
  depends_on = [
    aws_iam_role.kp_logs_processor_lambda_role
  ]
}

resource "aws_lambda_alias" "kp_logs_processor_alias" {
  name             = var.kp_logs_processor_alias_name
  description      = var.kp_logs_processor_alias_description
  function_name    = aws_lambda_function.kp_logs_processor_handler.function_name
  function_version = "$LATEST"
}
