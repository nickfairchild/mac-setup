#!/usr/bin/env bash

# Apps to install
source apps/brews.sh
source apps/casks.sh
source apps/npms.sh

source scripts/functions.sh

source settings/git.sh

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
brew tap homebrew/dupes
brew tap caskroom/cask

fails=()

echo "Installing brews ..."
brew info ${brews[@]}
install 'brew install' ${brews[@]}

echo "Tapping casks ..."
brew cask info ${casks[@]}
install 'brew cask install' ${casks[@]}

# Install or update composer
if test ! $(which composer); then
    echo "Installing composer ..."
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    php -r "if (hash_file('SHA384', 'composer-setup.php') === '92102166af5abdb03f49ce52a40591073a7b859a86e8ff13338cf7db58a19f7844fbc0bb79b2773bf30791e935dbd938') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
    php composer-setup.php
    php -r "unlink('composer-setup.php');"
    if [ ! -d "/usr/local/bin/" ]; then
        mkdir -p "/usr/local/bin"
    fi
    mv composer.phar /usr/local/bin/composer
else
    echo "Composer already installed"
    echo "Updating composer ..."
    composer self-update
fi

echo "Installing npms ..."
install 'npm install --global' ${npms[@]}

echo "Setting git defaults ..."
for config in "${git_configs[@]}"
do
    git config --global ${config}
done

# Clean up
echo "Cleaning up ..."
brew cleanup
brew cask cleanup

for fail in ${fails[@]}
do
    echo "Failed to install: $fail"
done

# Install Oh-my-Zsh
if test ! $(which zsh); then
    brew install zsh
    echo "Installing Oh-my-Zsh ..."
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

echo "Done!"