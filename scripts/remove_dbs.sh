#!/bin/bash

# Setup mysql config for username and password seperately for security
# mysql_config_editor set --login-path=local --host=localhost --user=forge --password
# Use "~/.logins" as the login path

# Function to get list of databases
get_databases() {
  mysql --login-path=~/.logins -e 'SHOW DATABASES;' | awk 'NR>1'
}

# Check if any arguments were passed
if [ $# -eq 0 ]; then
    echo "No database patterns provided. Exiting..."
    exit 1
fi

# Get list of databases
databases=$(get_databases)

# Loop through database patterns passed as arguments and match with existing databases
for pattern in "$@"; do
  matching_dbs=()
  for db in $databases; do
    if [[ $db =~ $pattern ]]; then
      matching_dbs+=($db)
    fi
  done

  # Show list of databases that will be deleted
  if [ ${#matching_dbs[@]} -eq 0 ]; then
    echo "No databases match the pattern $pattern."
  else
    echo "Databases matching the pattern $pattern:"
    for db in "${matching_dbs[@]}"; do
      echo "  - $db"
    done

    read -p "Are you sure you want to drop these databases? [y/N]: " confirm

    if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
      for db in "${matching_dbs[@]}"; do
        mysql --login-path=~/.logins -e "DROP DATABASE $db;"
        echo "Dropped database: $db"
      done
    else
      echo "Skipped dropping databases."
    fi
  fi
done
