#!/usr/bin/env bash


RESOURCES="`pwd`/resources"
GIT='git --git-dir='$PWD'/.git'
MESSAGE="Backup settings in `date`"
FILES="files.txt"

getFiles() {
    files=()
    while IFS= read -r line;
    do
        files+=("$line")
    done < "$1"
}

backup() {
    echo "Backuping all setting files"

    getFiles $FILES
    for f in "${files[@]}";
    do
        p_file="${f/#\~/$HOME}"

        if [[ -f $p_file ]]; then
            echo "$p_file => copying file"
            cp $p_file $RESOURCES
        else
            echo "$p_file => not found"
        fi
    done
    
    $GIT add .
    $GIT commit -m "$MESSAGE"
    $GIT push
}

restore() {
    echo "Put all files in each folder"
}

if [[ "$1" == "backup" ]]; then
    backup
elif [[ "$1" == "restore" ]]; then
    restore
fi
