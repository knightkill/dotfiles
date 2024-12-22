#!/bin/bash

# Check if any arguments are passed
if [ "$#" -eq 0 ]; then
  echo "Usage: concat_files.sh /path/to/files or /path/to/files/**"
  exit 1
fi

# Function to concatenate files
concat_files() {
  local pattern="$1"
  # Use find to get all files matching the pattern, ignoring directories
  find "$(dirname "$pattern")" -type f -name "$(basename "$pattern")" -print | while read -r abs_path; do
    if [ -f "$abs_path" ]; then
      echo "=== $abs_path ==="
      cat "$abs_path"
      echo ""
    fi
  done
}

# Loop through each file passed as an argument
for rel_path in "$@"; do
  # Check if the argument is a glob pattern with '**'
  if [[ "$rel_path" == *"**"* ]]; then
    # Replace '**' with '*' to match all files in subdirectories
    concat_files "${rel_path//\*\*/}"
  else
    # Convert relative paths to absolute paths
    abs_path=$(realpath "$rel_path")
    
    # Check if the file exists
    if [ -f "$abs_path" ]; then
      echo "=== $abs_path ==="
      cat "$abs_path"
      echo ""
    else
      echo "Skipping: $abs_path (Not a valid file)"
    fi
  fi
done
