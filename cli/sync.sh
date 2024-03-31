
# This script requires executable permissions to run. 
# Use chmod +x <script_name>.sh to make it executable.

copy_lib_with_timestamp() {
  local timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
  local archive_dir="archive/$timestamp/lib"
  mkdir -p "$archive_dir"
  cp -r lib/* "$archive_dir"
  echo "Copied lib folder to: $archive_dir"
}

# Function to download and extract salt project's lib folder
download_and_extract_lib() {
  local keep_temp="$1"

  # Download the project using environment variables
  flutterflow export-code --project "$PROJECT_NAME" --dest ./temp --token "$ACCESS_TOKEN" --no-parent-folder

  # Check if download was successful
  if [ $? -eq 0 ]; then
    echo "Downloaded project: $PROJECT_NAME"

    # Replace existing ./lib/ folder with extracted one
    rm -rf ./lib
    mv "temp/lib" lib
    echo "Extracted lib folder from downloaded project."

    # Remove the ./temp folder only if not using --keep flag
    if [[ $keep_temp == false ]]; then
    echo "Removing temp folder after download."
      rm -rf ./temp
    else
      echo "Keeping temp folder after download."
    fi
  else
    echo "Error downloading project: $PROJECT_NAME"
  fi
}

# Function to load environment variables from .env file
load_env() {
  if [ -f ".env" ]; then
    # Read environment variables from .env file (handle multiple lines)
    set -a
    source .env
    set +a
  fi
  export PROJECT_NAME=${PROJECT_NAME:-""}  # Set default empty string if not found
  export ACCESS_TOKEN=${ACCESS_TOKEN:-""}  # Set default empty string if not found
}

# Function to save environment variables to .env file
save_env() {
  local project_name="$1"
  local token="$2"
  
  echo "PROJECT_NAME=$project_name" >> .env
  echo "ACCESS_TOKEN=$token" >> .env
}

# Function to prompt for missing environment variables
check_env() {
  if [ -z "$PROJECT_NAME" ]; then
    read -p "Enter project name: " PROJECT_NAME
  fi
  if [ -z "$ACCESS_TOKEN" ]; then
    read -p "Enter your access token: " ACCESS_TOKEN
  fi

  # Optionally save variables to .env (if desired)
  save_env "$PROJECT_NAME" "$ACCESS_TOKEN"
}

# Function to check and add .env and archive to .gitignore
check_and_add_gitignore() {
  grep -q "^\.env$" .gitignore || echo ".env" >> .gitignore  # Check and add .env
  grep -q "^archive/" .gitignore || echo "archive/" >> .gitignore  # Check and add archive/
}


# Check for --keep flag, default to false
if [[ "$1" == "--keep" ]]; then
  keep_temp="true"  # Assign a string value to keep_temp
else
  keep_temp="false"
fi

check_and_add_gitignore
load_env
check_env
copy_lib_with_timestamp
download_and_extract_lib "$keep_temp"

echo "Process completed."
