#!/bin/bash
sudo apt install -y libclang-dev libudev-dev libfontconfig-dev 

cd $HOME/src/ 
git clone https://gitlab.com/asus-linux/asusctl.git 
cd asusctl
make
sudo make install
