variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "description" {
  description = "Description of the Lambda function"
  type        = string
  default     = ""
}

variable "filename" {
  description = "Path to the function's deployment package within the local filesystem"
  type        = string
}

variable "source_code_hash" {
  description = "Used to trigger updates when file content changes"
  type        = string
}

variable "handler" {
  description = "Function entrypoint in your code"
  type        = string
}

variable "runtime" {
  description = "Lambda runtime to use"
  type        = string
}

variable "timeout" {
  description = "Amount of time your Lambda function has to run in seconds"
  type        = number
  default     = 3
}

variable "memory_size" {
  description = "Amount of memory in MB your Lambda function can use"
  type        = number
  default     = 128
}

variable "environment_variables" {
  description = "Environment variables for the Lambda function"
  type        = map(string)
  default     = {}
}

variable "log_retention_in_days" {
  description = "Retention period for CloudWatch Logs"
  type        = number
  default     = 14
}

variable "create_eventbridge_rule" {
  description = "Whether to create an EventBridge rule for this Lambda"
  type        = bool
  default     = false
}

variable "event_schedule_expression" {
  description = "EventBridge schedule expression for the rule"
  type        = string
  default     = null
}

variable "event_pattern" {
  description = "EventBridge pattern for the rule"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}