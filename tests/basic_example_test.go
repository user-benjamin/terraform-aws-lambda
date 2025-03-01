package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestBasicExample(t *testing.T) {
	// Arrange
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../examples/basic",
	})

	// Act
	// Init and plan only - we don't want to actually create resources during tests
	terraform.InitAndPlan(t, terraformOptions)

	// Assert
	// For a more comprehensive test, you would apply the Terraform code and then check
	// the outputs or make API calls to verify the infrastructure was created correctly.
	// Here we're just verifying that the plan succeeds.
	output := terraform.Output(t, terraformOptions, "example_output")
	assert.Equal(t, "example_value", output)
}
