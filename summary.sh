#!/bin/bash

repeat()
{
    for i in $(seq 4 $1); do echo -n '\t'; done
}

cd docs/
SRC_FILE=$(ls | grep .md | grep -v "$1" | grep -v "$2") 
echo -e "## Sommaire" > "$1"

for file in ${SRC_FILE}
do 
    echo "Merging the ${file} file"
    for topic in $(cat ${file} | grep -i '^[#]' | sed 's/ /-/g' | sed -e 's/\-*$//g')
    do
        count=$(echo ${topic} | cut -d '-' -f 1 | wc -m)
        offset=$(repeat ${count})
        topic=$(echo ${topic} | cut -d '-' -f 2-)
        echo -e "${offset}- [${topic}](#${topic,,})" >> $1
    done
done



