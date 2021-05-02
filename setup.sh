#!/usr/bin/env bash

echo $'Welcome to the Dotfiles setup script!\n'

if [[ "$OSTYPE" == "darwin"* ]]; then
    echo $'You\'re using macOS!\n'

    source brew.sh
    source macOS.sh
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo $'You\'re using Linux!\n'

    # TODO: Create these scripts
    source apt.sh
    source ubuntu.sh
fi

source dotfiles.sh
