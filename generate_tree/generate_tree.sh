#!/bin/bash
# Ronald Baker


# Directory to generate the tree from
START_DIR=${1:-.} # Default to the current directory if no argument is provided

# Output file
OUTPUT_FILE="folder_tree.txt"

# Function to generate the tree structure
generate_tree() {
    local dir="$1"
    local indent="$2"

    for entry in "$dir"/*; do
        if [ -d "$entry" ]; then
            echo "${indent}📂 $(basename "$entry")" >> "$OUTPUT_FILE"
            generate_tree "$entry" "$indent    "
        elif [ -f "$entry" ]; then
            echo "${indent}📄 $(basename "$entry")" >> "$OUTPUT_FILE"
        fi
    done
}

# Start script
echo "Generating folder tree for $START_DIR..."
echo "Tree Structure (from $START_DIR):" > "$OUTPUT_FILE"
generate_tree "$START_DIR" ""

# Print success message
echo "Folder tree saved to $OUTPUT_FILE"

