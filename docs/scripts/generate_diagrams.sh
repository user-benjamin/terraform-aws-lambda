#!/bin/bash

# Create the diagrams directory if it doesn't exist
mkdir -p docs/diagrams

# Check if terraform-visual is installed
if ! command -v terraform-visual &> /dev/null; then
    echo "terraform-visual is not installed. Installing..."
    npm install -g terraform-visual
fi

# Generate diagrams for the main module
echo "Generating diagram for main module..."
terraform-visual --dir . --out-file docs/diagrams/main_module.mmd --mermaid

# Generate diagrams for each example
for example_dir in examples/*; do
    if [ -d "$example_dir" ]; then
        example_name=$(basename "$example_dir")
        echo "Generating diagram for example: $example_name..."
        terraform-visual --dir "$example_dir" --out-file "docs/diagrams/${example_name}_example.mmd" --mermaid
    fi
done

# Convert Mermaid files to Markdown with embedded Mermaid
for mmd_file in docs/diagrams/*.mmd; do
    if [ -f "$mmd_file" ]; then
        base_name=$(basename "$mmd_file" .mmd)
        md_file="docs/diagrams/${base_name}.md"
        
        echo "# ${base_name//_/ } Diagram" > "$md_file"
        echo "" >> "$md_file"
        echo '```mermaid' >> "$md_file"
        cat "$mmd_file" >> "$md_file"
        echo '```' >> "$md_file"
    fi
done

echo "Diagram generation complete!"
