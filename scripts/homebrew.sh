#!/usr/bin/env bash

# Install or upgrade Homebrew
if test ! $(which brew); then
    echo "Installing Xcode command line tools ..."
    xcode-select --install

    echo "Installing Homebrew ..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Homebrew already installed"
    echo "Updating Homebrew ..."
    brew update
    brew upgrade
fi

brew doctor

echo "Installing brews and casks ..."
brew tap homebrew/bundle
brew bundle

# Clean up
echo "Cleaning up ..."
brew cleanup
brew cask cleanup

echo "Brews installed!"