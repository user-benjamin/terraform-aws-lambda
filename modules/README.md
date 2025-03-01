# Internal Sub-modules

This directory contains internal sub-modules that are used by the main module. These sub-modules are not meant to be used directly by users of the module.

## Creating Sub-modules

When creating a sub-module, follow the same structure as the main module:

```
modules/sub-module-name/
├── README.md       # Documentation for the sub-module
├── main.tf         # Main resources
├── variables.tf    # Input variables
├── outputs.tf      # Output variables
└── versions.tf     # Required versions (if needed)
```
