#!/bin/zsh

gpull () {
    local branch=""
    eval "branch=\$(git rev-parse --abbrev-ref HEAD)"
    local cmd="git pull origin $branch"
    echo -e "\e[32m$cmd\e[0m"  # Green color for selected item
    eval $cmd
}