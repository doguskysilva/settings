#!/usr/bin/env bash

# start a copy of all files to this folder
# add all files to stage and commit with a default file message
# make a git push

#file="files.txt"
destination="`pwd`/resources"

getFiles() {
    files=()
    while IFS= read -r line;
    do
        files+=("$line")
    done < "$1"
}

backup() {
    echo "Backuping all setting files"

    getFiles "files.txt"
    for f in "${files[@]}";
    do
        p_file="${f/#\~/$HOME}"

        if [[ -f $p_file ]]; then
            echo "$p_file => starting backup"
            cp $p_file $destination
        else
            echo "$p_file => not found"
        fi
    done
}

restore() {
    echo "Put all files in each folder"
}

if [[ "$1" == "backup" ]]; then
    backup
elif [[ "$1" == "restore" ]]; then
    restore
fi
