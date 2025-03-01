# Lambda Function and related resources
resource "aws_lambda_function" "this" {
  function_name    = var.function_name
  description      = var.description
  filename         = var.filename
  source_code_hash = var.source_code_hash
  handler          = var.handler
  runtime          = var.runtime
  timeout          = var.timeout
  memory_size      = var.memory_size
  role             = aws_iam_role.lambda_execution.arn
  
  environment {
    variables = var.environment_variables
  }
  tracing_config {
    enable = var.tracing_enable
    mode = var.tracing_mode
  }
  tags = var.tags
}

# IAM role for Lambda execution
resource "aws_iam_role" "lambda_execution" {
  name = "${var.function_name}-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })

  tags = var.tags
}

# CloudWatch Logs policy attachment
resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.lambda_execution.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# CloudWatch Log Group for Lambda
resource "aws_cloudwatch_log_group" "lambda" {
  count      = var.enable_logs ? 1 : 0
  name              = "/aws/lambda/${var.function_name}"
  retention_in_days = var.log_retention_in_days
  tags              = var.tags
}

# EventBridge Rule
resource "aws_cloudwatch_event_rule" "this" {
  count       = var.create_eventbridge_rule ? 1 : 0
  name        = "${var.function_name}-rule"
  description = "EventBridge rule for ${var.function_name}"
  
  schedule_expression = var.event_schedule_expression
  event_pattern       = var.event_pattern
  
  tags = var.tags
}

# EventBridge Target
resource "aws_cloudwatch_event_target" "this" {
  count     = var.create_eventbridge_rule ? 1 : 0
  rule      = aws_cloudwatch_event_rule.this[0].name
  target_id = "${var.function_name}-target"
  arn       = aws_lambda_function.this.arn
}

# Lambda Permission for EventBridge
resource "aws_lambda_permission" "eventbridge" {
  count         = var.create_eventbridge_rule ? 1 : 0
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.this[0].arn
}