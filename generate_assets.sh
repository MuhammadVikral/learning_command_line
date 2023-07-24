#!/bin/bash

# Replace '/path/to/directory' with the actual directory path you want to list files from
directory="assets/"

# Use the 'find' command to get a list of all files in the directory and store the result in the 'files' variable
files=$(find "$directory" -type f)
finalString=""
for path in $files; do
	file=$(basename "$path")
	filename=${file%.*}
	toPascall=$(echo $filename | sed 's/_\([a-z]\)/\U\1/g; s/_//g')
	if [[ $file == *.svg ]]; then
		isExist=$(echo "$assetList" | grep $toPascall)
		assetList=$(cat $(find -name assets_image.dart))
		if [[ -n "$isExist" ]]; then
			echo "$toPascall already exist"
		else
			finalString="$finalString\nstatic const $toPascall = \"\$iconsPath/$file\";"
		fi
	else
		assetList=$(cat $(find -name assets_image.dart))
		isExist=$(echo "$assetList" | grep $toPascall)
		if [[ -n "$isExist" ]]; then
			echo "$toPascall already exist"
		else
			finalString="$finalString static const $toPascall = \"\$imagesPath/$file\";"
		fi
	fi
	# echo "$finalString"
done
echo $(find -name "assets_image.dart") | xargs sed -i "/generated/a\\$finalString"
