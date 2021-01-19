#!/usr/bin/env bash

echo $'Bootstrapping dotfiles...\n'

# Symlink dotfiles to appropriate directories
# TODO: Maybe redo vim symlink
ln -sv vim/vimrc ~/.vimrc
ln -sv vim ~/.vim
ln -sv zsh/.zshrc ~
cp zsh/.hushlogin ~
ln -sv vscode/settings.json ~/Library/Application\ Support/Code/User
cp xcode/Custom\ Default\ (Dark).xccolortheme ~/Library/Developer/Xcode/UserData/FontAndColorThemes
# TODO: Make script out of Xcode plist using `defaults` API
# cp xcode/com.apple.dt.Xcode.plist ~/Library/Perferences

# Install VSCode extensions
for line in $(cat vscode/extensions)
do
    code --install-extension $line
done

echo $'Configure iTerm 2 to read our preferences by going to Preferences > General > Preferences > Load preferences...\n'