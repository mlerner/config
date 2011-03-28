#!/usr/bin/env bash

backupDir=/tmp/backup$(date "+%s")
configFiles=( .vimrc .zshrc .gitconfig .config/openbox/autostart.sh .config/openbox/menu.xml .config/openbox/rc.xml )
mkdir $backupDir
for file in configFiles
do
   mv ~/$file $backupDir
done
echo "Your config files have been backed up to: $backupDir"

mkdir -p ~/.config/openbox

ln -s $(pwd)/openbox/autostart.sh ~/.config/openbox/autostart.sh 
ln -s $(pwd)/openbox/menu.xml ~/.config/openbox/menu.xml 
ln -s $(pwd)/openbox/rc.xml ~/.config/openbox/rc.xml 

ln -s $(pwd)/gitconfig ~/.gitconfig 
ln -s $(pwd)/vimrc ~/.vimrc 
ln -s $(pwd)/zshrc ~/.zshrc
