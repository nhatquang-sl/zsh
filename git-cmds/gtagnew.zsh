#!/bin/zsh

gtagnew () {
    local tagName=$1

    if [[ ${#tagName} -gt 0 ]]; then # Up
        echo -e "\e[32mgit tag -a $tagName -m \"$tagName\"\e[0m"
        eval "git tag -a $tagName -m \"$tagName\""
        eval "git push origin $tagName"
        return
    fi
}