#!/usr/bin/env bash

backupDir=/tmp/backup$(date "+%s")
configFiles=( .vimrc .zshrc .gitconfig .vim .Xdefaults )
mkdir $backupDir
for file in ${configFiles}
do
   mv ~/$file $backupDir
done
echo "Your config files have been backed up to: $backupDir"

mkdir -p ~/.config/openbox

ln -sf $(pwd)/Xdefaults ~/.Xdefaults
ln -sf $(pwd)/gitconfig ~/.gitconfig 
ln -sf $(pwd)/vim ~/.vim 
ln -sf $(pwd)/vimrc ~/.vimrc 
ln -sf $(pwd)/zshrc ~/.zshrc
