#!/usr/bin/env bash

# Process option selection
# Parameters:
# $1 = The option to process
process_option() {
  case $1 in
    'h')
      sh scripts/homebrew.sh
      break;;
    'n')
      sh scripts/npm.sh
      break;;
    'c')
      sh scripts/composer.sh
      break;;
    'hs')
      sh scripts/homestead.sh
      break;;
    'z')
      sh scripts/zsh.sh
      break;;
    'd')
      sh scripts/defaults.sh
      break;;
    's')
      sh scripts/setup.sh
      break;;
    'df')
      sh scripts/dotfiles.sh
      break;;
    'i')
      caffeinate_machine
      sh scripts/homebrew.sh
      sh scripts/npm.sh
      sh scripts/composer.sh
      sh scripts/homestead.sh
      sh scripts/zsh.sh
      sh scripts/defaults.sh
      sh scripts/setup.sh
      sh scripts/dotfiles.sh
      break;;
    'cs')
      break;;
    'C')
      caffeninate_machine
      break;;
    'q')
      break;;
    *)
      print_red "ERROR: Invalid option.\n"
      break;;
  esac
}
export -f process_option