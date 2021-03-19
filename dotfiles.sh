#!/usr/bin/env bash

echo $'Bootstrapping dotfiles...\n'

# Symlink dotfiles to appropriate directories
# TODO: Prevent recursive symlinking
ln -sv ~/.config/zsh/zshrc ~/.zshrc
ln -sv ~/.config/bash/bashrc ~/.bashrc
cp ~/.config/zsh/hushlogin ~/.hushlogin

# Symlink clangd to /usr/local/bin because I don't want to add all of LLVM To PATH
ln -sv /usr/local/opt/llvm/bin/clangd /usr/local/bin

# TODO: Check if FontAndColorThemes exists before copying
cp "~/.config/xcode/Custom Default (Dark).xccolortheme" ~/Library/Developer/Xcode/UserData/FontAndColorThemes

# TODO: I may need to change this because iTerm supports storing preferences in .config folder
echo $'Configure iTerm 2 to read our preferences by going to Preferences > General > Preferences > Load preferences...\n'
