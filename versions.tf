# Required Terraform and provider versions

terraform {
  required_version = ">= 1.0.0"
  
  # Example provider requirements
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
