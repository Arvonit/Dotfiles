#!/usr/bin/env bash

# Check if Homebrew is available and install it if it isn't
if test !$(which brew); then
    echo 'Installing homebrew...'
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
fi

echo 'Installing programms...\n'
brew update
brew brew/Brewfile