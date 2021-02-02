#!/usr/bin/env bash

echo $'Bootstrapping dotfiles...\n'

# Symlink dotfiles to appropriate directories
# TODO: Prevent recursive symlinking
ln -sv ~/.config/vim/.vimrc ~
ln -sv ~/.config/vim ~/.vim
ln -sv ~/.config/zsh/.zshrc ~
ln -sv ~/.config/bash/.bashrc ~
cp ~/.config/zsh/.hushlogin ~

# TODO: Check if FontAndColorThemes exists before copying
cp "~/.config/xcode/Custom Default (Dark).xccolortheme" ~/Library/Developer/Xcode/UserData/FontAndColorThemes

echo $'Configure iTerm 2 to read our preferences by going to Preferences > General > Preferences > Load preferences...\n'
