#!/bin/zsh

gpush () {
    local branch=""
    eval "branch=\$(git rev-parse --abbrev-ref HEAD)"
    local cmd="git push origin $branch"
    echo -e "\e[32m$cmd\e[0m"  # Green color for selected item
    eval $cmd
}