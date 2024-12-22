#!/bin/bash

# Initial root directory, default to current directory if no parameter is given
INITIAL_DIR="${1:-.}"

# Define directories to search for and remove
dirs_to_remove=("node_modules" "build" "vendor")

# Define directories to exclude from traversal
dirs_to_exclude=("public" "resources" "wp-content" "wp-includes" "venv")

# Array to store directories that will be deleted
dirs_to_delete=()

# Recursive function to find directories to delete
find_dirs() {
  for dir in "$1"/*; do
    if [ -d "$dir" ]; then
      dir_name=$(basename "$dir")
      # Skip excluded directories
      if [[ " ${dirs_to_exclude[*]} " == *" $dir_name "* ]]; then
        continue
      fi

      # Check if directory should be removed
      if [[ " ${dirs_to_remove[*]} " == *" $dir_name "* ]]; then
        dirs_to_delete+=("$dir")
      else
        find_dirs "$dir"
      fi
    fi
  done
}

# Initial function call
find_dirs "$INITIAL_DIR"

# Show directories to be deleted
echo "The following directories will be deleted:"
for dir in "${dirs_to_delete[@]}"; do
  echo "$dir"
done

# Ask for confirmation
read -p "Are you sure you want to proceed? (y/n): " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
  # Delete directories
  for dir in "${dirs_to_delete[@]}"; do
    rm -rf "$dir"
  done
  echo "Deletion completed."
else
  echo "Deletion canceled."
fi
