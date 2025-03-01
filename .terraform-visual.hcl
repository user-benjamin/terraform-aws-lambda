# Terraform Visual Configuration

# General configuration
title = "Terraform Module Template"
description = "Visualization of the module resources and relationships"

# Diagram type
# Available options: graph, sequence, class, state, er, gantt, pie, flow
diagram_type = "graph"

# Resource grouping
group_by = "type"

# Styling
theme = "default"
direction = "TD" # Top-Down

# Include resources
include_resources = ["*"]

# Exclude resources
exclude_resources = []

# Custom resource colors
resource_colors = {
  "aws_s3_bucket" = "#FF9900"
  "aws_iam_role" = "#232F3E"
}

# Custom node labels
custom_labels = {
  "aws_s3_bucket" = "S3 Bucket"
  "aws_iam_role" = "IAM Role"
}
