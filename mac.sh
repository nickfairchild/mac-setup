#!/usr/bin/env bash

source lib/installer.sh
source lib/functions.sh

while true; do
  if [[ $# == 0 ]]; then
    printf "\nUsage: mac OPTION\n"
    printf "\nOSX Options:\n"
    printf "  Setup:\n"
    printf "    h:  Install Homebrew and casks.\n"
    printf "    n:  Install npms.\n"
    printf "    c:  Install composer.\n"
    printf "    hs: Install homestead.\n"
    printf "    z:  Install oh-my-zsh.\n"
    printf "    d:  Apply OSX defaults.\n"
    printf "    s:  Setup and configure installed software.\n"
    printf "    df: Symlink dotfiles.\n"
    printf "    i:  Install everything (i.e. executes all options, listed above, top to bottom).\n"
    printf "  Manage:\n"
    printf "    cs: Check status of managed software.\n"
    printf "    C:  Caffeinate machine.\n"
    printf "    q:  Quit/Exit.\n\n"
    read -p "Enter Selection: " response
    printf "\n"
    process_option $response
  else
    process_option $1
  fi
done
