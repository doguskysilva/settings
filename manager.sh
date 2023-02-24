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
    echo "Backuping all setting files \n"

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
    echo "Restoring files in each folder \n"
    
    getFiles $FILES
    for f in "${files[@]}";
    do
        p_file="${f/#\~/$HOME}"
        path="$(dirname $p_file)"
        file="$(basename $p_file)"
        r_file="$RESOURCES/$file"
        
        if [[ -f $r_file ]]; then
            if [[ ! -d $path ]]; then
                mkdir -p $path
            fi
            echo "$r_file => $p_file"
            cp $r_file $path
        fi
    done
}

if [[ "$1" == "backup" ]]; then
    backup
elif [[ "$1" == "restore" ]]; then
    restore
fi
