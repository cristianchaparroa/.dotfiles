#!/bin/bash

sudo apt-get install -y fonts-powerline

mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
sudo chmod +x ~/.local/share/fonts 
sudo chown -R $USER ~/.local/share/fonts
#select the fonts that you want to download from
# https://www.nerdfonts.com/font-downloads
fonts=('DroidSansMono' 'FiraCode' 'FiraMono' 'GeistMono' 'Hack' 'Inconsolata')

echo "$PWD"
for f in "${fonts[@]}"
do 
    wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/$f.zip"
    unzip -o "$f.zip"
    rm "$f.zip"
done   

sudo fc-cache -fv



