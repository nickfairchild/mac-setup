#!/usr/bin/env bash

# Install Oh-my-Zsh
if test ! $(which zsh); then
    brew install zsh
    echo "Installing Oh-my-Zsh ..."
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi