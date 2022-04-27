#!/usr/bin/env sh

cmd_exist () {
    command -v "$1" > /dev/null 2>&1
    echo $?
}

