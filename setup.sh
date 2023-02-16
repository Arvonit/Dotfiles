#!/usr/bin/env bash

symlink () {
    src="$1"
    target="$2"
    
    # Make sure source path and target path were provided
    if [[ -z $src ]] && [[ -z $target ]]; then
        echo "need to include source and target paths"
        return 1
    fi
    
    # Symlink if it does not exist
    if [[ ! -L $target ]]; then
        echo "symlink doesn't exist, creating..."
        ln -sv $src $target
        return $?
    fi
    
    # Fix symlink if it is broken
    if [[ ! -e $target ]]; then
        echo "symlink is broken, fixing..."
        unlink $target
        ln -sv $src $target
        return $?
    fi
    
    echo "symlink at $target already exists"
    return 1
}

echo $'Bootstrapping dotfiles...\n'

# Symlink dotfiles to appropriate directories
symlink ~/.config/zsh/zshrc ~/.zshrc
symlink ~/.config/bash/bashrc ~/.bashrc
symlink ~/.config/mail/mailrc ~/.mailrc
cp -nv ~/.config/zsh/hushlogin ~/.hushlogin
