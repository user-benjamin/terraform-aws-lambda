# Input variables

# variable "example_var" {
#  description = "Example input variable"
#  type        = string
#  default     = null
#}

# Example variable with validation
# variable "environment" {
#   description = "Environment name (dev, staging, prod)"
#   type        = string
#   validation {
#     condition     = contains(["dev", "staging", "prod"], var.environment)
#     error_message = "Valid values for environment are: dev, staging, prod."
#   }
# }

# Example map variable
# variable "tags" {
#   description = "Tags to apply to all resources"
#   type        = map(string)
#   default     = {}
# }
