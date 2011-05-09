#!/usr/bin/env bash

backupDir=/tmp/backup$(date "+%s")
configFiles=( .vimrc .zshrc .gitconfig .vim .config/openbox/autostart.sh .config/openbox/menu.xml .config/openbox/rc.xml )
mkdir $backupDir
for file in ${configFiles}
do
   mv ~/$file $backupDir
done
echo "Your config files have been backed up to: $backupDir"

mkdir -p ~/.config/openbox

ln -sf $(pwd)/openbox/autostart.sh ~/.config/openbox/autostart.sh 
ln -sf $(pwd)/openbox/menu.xml ~/.config/openbox/menu.xml 
ln -sf $(pwd)/openbox/rc.xml ~/.config/openbox/rc.xml 

ln -sf $(pwd)/gitconfig ~/.gitconfig 
ln -sf $(pwd)/vim ~/.vim 
ln -sf $(pwd)/vimrc ~/.vimrc 
ln -sf $(pwd)/zshrc ~/.zshrc
