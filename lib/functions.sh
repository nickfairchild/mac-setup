#!/usr/bin/env bash

function print_red {
    red='\x1B[0;31m'
    NC='\x1B[0m' # no color
    echo -e "${red}$1${NC}"
}
export -f print_red

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
export -f install

# Caffeinate machine.
caffeinate_machine() {
  local pid=$(ps aux | grep caffeinate | grep -v grep | awk '{print $2}')

  if [[ -n "$pid" ]]; then
    printf "Whoa, tweaker, machine is already caffeinated!\n"
  else
    caffeinate -s -u -d -i -t 3153600000 > /dev/null &
    printf "Machine caffeinated.\n"
  fi
}
export -f caffeinate_machine