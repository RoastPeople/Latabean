#!/bin/bash

for file in $(find latabean latabeaninit | grep 'lua$'); do
	MODULE=$(echo $file | sed -e 's/\.lua$//' -e 's/\//./g' -e 's/\.init$//')
	echo "[\"$MODULE\"] = \"$file\","
done

