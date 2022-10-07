#!/bin/bash

sudo apt install fish -y 
sudo curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > install
sudo fish install --path=~/.local/share/omf --config=~/.config/omf

