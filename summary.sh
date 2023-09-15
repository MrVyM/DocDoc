#!/bin/bash

cd docs/
SRC_FILE=$(ls | grep .md | grep -v "$1" | grep -v "$2") 
echo -e "## Sommaire" > "$1"

for file in ${SRC_FILE}
do 
    echo "Merging the ${file} file"
    filename=$(echo ${file} | cut -d "." -f 1)
    echo -e "- [$filename]($(head -n 1 ${file} | sed 's/# /#/1'))" >> $1
done
