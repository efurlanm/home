#!/bin/bash

# Function to convert .ipynb files to .md
convert_ipynb_to_md() {
    local ipynb_file="$1"
    local md_file="${ipynb_file%.ipynb}.md"
    
    # Check if the .md file already exists and if the date and time are the same as the .ipynb file
    if [ -f "$md_file" ]; then
        if [ "$(stat -c %Y "$ipynb_file")" -eq "$(stat -c %Y "$md_file")" ]; then
            return
        fi
    fi
    
    # Convert the .ipynb file to .md
    jupyter nbconvert --to markdown "$ipynb_file"
    
    # Set the date and time of the .md file to be the same as the .ipynb file
    touch -r "$ipynb_file" "$md_file"
}

# Find all .ipynb files in subdirectories and perform the conversion
find . -type d \( -path '*/.*' -prune \) -o -type f -name '*.ipynb' -print | while read -r ipynb_file; do
    convert_ipynb_to_md "$ipynb_file"
done
 
