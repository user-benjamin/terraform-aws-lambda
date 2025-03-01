.PHONY: init fmt validate lint test docs diagrams all clean

SHELL := /bin/bash

# This Makefile is intended for local development only.
# GitHub Actions will handle CI/CD tasks in the pipeline.

init:
	@echo "Initializing local development environment..."
	@terraform init -backend=false

fmt:
	@echo "Formatting Terraform code..."
	@terraform fmt -recursive

validate:
	@echo "Validating Terraform code..."
	@terraform validate

lint:
	@echo "Linting Terraform code locally..."
	@tflint --init
	@tflint --recursive

test:
	@echo "Running tests locally..."
	@cd tests && go test -v ./...

docs:
	@echo "Generating documentation locally (for preview only)..."
	@if command -v terraform-docs >/dev/null 2>&1; then \
		terraform-docs .; \
	else \
		echo "terraform-docs not installed. Install with: brew install terraform-docs"; \
	fi

diagrams:
	@echo "Generating diagrams locally (for preview only)..."
	@if command -v terraform-visual >/dev/null 2>&1; then \
		bash docs/scripts/generate_diagrams.sh; \
	else \
		echo "terraform-visual not installed. Install with: npm install -g terraform-visual"; \
	fi

pre-commit:
	@echo "Running pre-commit hooks locally..."
	@pre-commit run --all-files

# Run common development tasks
dev: fmt validate lint

# Run all checks before submitting PR
pre-pr: fmt validate lint test docs diagrams

clean:
	@echo "Cleaning local development artifacts..."
	@find . -type d -name ".terraform" -exec rm -rf {} +
	@find . -type f -name ".terraform.lock.hcl" -delete

help:
	@echo "Terraform Module Template Makefile"
	@echo ""
	@echo "Usage:"
	@echo "  make init       - Initialize Terraform"
	@echo "  make fmt        - Format Terraform code"
	@echo "  make validate   - Validate Terraform code"
	@echo "  make lint       - Run TFLint"
	@echo "  make test       - Run Terratest tests"
	@echo "  make docs       - Generate documentation locally"
	@echo "  make diagrams   - Generate diagrams locally"
	@echo "  make pre-commit - Run pre-commit hooks"
	@echo "  make dev        - Run common development tasks (fmt, validate, lint)"
	@echo "  make pre-pr     - Run all checks before submitting a PR"
	@echo "  make clean      - Clean up local development artifacts"
	@echo ""
	@echo "Note: This Makefile is for local development only."
	@echo "      GitHub Actions will handle CI/CD tasks in the pipeline."
