#!/bin/bash

assetsDirectory="assets/"
files=$(find "$assetsDirectory" -type f)
finalString=""

writeFile() {
	assetList=$(cat $(find -name assets_image.dart))
	isExist=$(echo "$assetList" | grep $2)
	if [[ -n "$isExist" ]]; then
		echo "$toPascall already exist"
	else
		finalString="$finalString\n$1"
	fi
}

for path in $files; do
	file=$(basename $path)
	filename=${file%.*}
	toPascall=$(echo $filename | sed 's/_\([a-z]\)/\U\1/g; s/_//g')
	if [[ $file == *.svg ]]; then
		strings="static const $toPascall = '\$iconsPath/$file';"
		writeFile "$strings" "$toPascall"
	else
		strings="static const $toPascall = '\$imagesPath/$file';"
		writeFile "$strings" "$toPascall"
	fi
done

echo $(find -name "assets_image.dart") | xargs sed -i "/generated/a\\$finalString"
