#!/usr/bin/env bash

echo $'Welcome to the Dotfiles setup script!\n'

if [[ "$OSTYPE" == "darwin"* ]]; then
    echo $'You\'re using macOS!\n'

    source ~/.config/brew.sh
    source ~/.config/macOS.sh
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo $'You\'re using Linux!\n'

    # TODO: Create these scripts
fi

source ~/.config/bootstrap.sh
