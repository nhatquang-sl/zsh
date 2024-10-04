#!/bin/zsh

gcko () {
    local branch=$1

    if [[ ${#branch} -gt 0 ]]; then # Up
        echo -e "\e[32mgit checkout $branch\e[0m"  # Green color for selected item
        eval "git checkout $branch"
        return
    fi
    selectExeCmd "git branch" "git checkout [selectedCmd]"
}