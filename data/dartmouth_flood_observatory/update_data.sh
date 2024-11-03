#!/bin/sh

# Create the subfolder with the current date and time
new_folder="data_$(date +%Y_%m_%d_%H_%M_%S)"
mkdir -p "$new_folder"

# Use wget to download all files into the created subfolder
wget -r -np -nH --cut-dirs=1 -R "index.html*" -P "$new_folder" https://floodobservatory.colorado.edu/temp/

# Get the modification date/time of FloodArchive.txt from the server
mod_date=$(wget --server-response --spider https://floodobservatory.colorado.edu/temp/FloodArchive.txt 2>&1 | grep "Last-Modified" | cut -d' ' -f3-)

# Zip all files in the data folder except FloodArchive.txt
cd "$new_folder" || exit
zip -r ../"${new_folder}_archive.zip" . -x "FloodArchive.txt"
# Delete all files except FloodArchive.txt
find . -type f ! -name "FloodArchive.txt" -delete
cd ..

# Find the previous data folder (excluding the current one)
previous_folder=$(ls -td data_* | grep -v "$new_folder" | head -n 1)

# Compare the newly downloaded FloodArchive.txt with the previous one
if [ -n "$previous_folder" ] && [ -f "$previous_folder/FloodArchive.txt" ]; then
  if diff -u -w "$previous_folder/FloodArchive.txt" "$new_folder/FloodArchive.txt" > /dev/null; then
    echo "No new changes found"
    # Delete the newly created folder and zip file
    rm -rf "$new_folder"
    rm -f "${new_folder}_archive.zip"
  else
    echo "New changes were found"
    diff -u -w "$previous_folder/FloodArchive.txt" "$new_folder/FloodArchive.txt"
    # Copy the updated FloodArchive.txt to the current directory
    cp "$new_folder/FloodArchive.txt" .
    echo "FloodArchive.txt has been copied to the current directory"

    # Save the version information in FloodArchive_version.json
    current_time=$(date +"%Y-%m-%d %H:%M:%S")
    echo "{
  \"saved_date_time\": \"$current_time\",
  \"server_last_modified\": \"$mod_date\"
}" > FloodArchive_version.json
    echo "FloodArchive_version.json has been updated with the new version information"
  fi
else
  echo "No previous data to compare"
  cp "$new_folder/FloodArchive.txt" .
  # Save the version information in FloodArchive_version.json
  current_time=$(date +"%Y-%m-%d %H:%M:%S")
  echo "{
  \"saved_date_time\": \"$current_time\",
  \"server_last_modified\": \"$mod_date\"
}" > FloodArchive_version.json
  echo "FloodArchive_version.json has been created with the initial version information"
fi
