#!/usr/bin/env bash

# Check if Homebrew is available and install it if it isn't
if test !$(which brew); then
    echo 'Installing homebrew...'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 
fi

echo 'Installing programs...\n'
brew update
# TODO: Make sure Mac App Store is logged into before proceeding with `mas`
brew bundle install --file brew/Brewfile
