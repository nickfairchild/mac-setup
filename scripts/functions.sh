#!/usr/bin/env bash

function print_red {
    red='\x1B[0;31m'
    NC='\x1B[0m' # no color
    echo -e "${red}$1${NC}"
}

function install {
    cmd=$1
    shift
    for pkg in $@
    do
        exec="$cmd $pkg"
        echo "Executing: $exec"
        if $exec ; then
            echo "Installed: $pkg"
        else
            fails+=($pkg)
            print_red "Failed to execute: $exec"
        fi
    done
}