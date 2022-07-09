#!/bin/sh

lint() {
    file=$1

    if [ -f "$file" ]
    then
        shellcheck "$file"
    else
        for file in "$file"/*
        do
            [ -f "$file" ] && shellcheck "$file"
        done
    fi
}

lint "./arch/link/.local/bin"
lint "./scripts"
lint "./addplugin"
lint "./rmplugin"
lint "./shcheck.sh"
