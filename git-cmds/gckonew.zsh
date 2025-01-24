#!/bin/zsh

gckonew () {
    local branch=$1

    if [[ ${#branch} -gt 0 ]]; then # Up
        echo -e "\e[32mgit checkout -b $branch\e[0m"  # Green color for selected item
        eval "git checkout -b $branch"
    fi
}