#!/bin/bash

function update() {
    sudo apt -y update
    sudo apt -y upgrade
    sudo apt -y dist-upgrade
}

function install_base() {
    sudo apt install -y  curl wget git
    sudo apt install -y gnome gnome-shell
}


function insall_fish() {
    curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > install
    fish install --path=~/.local/share/omf --config=~/.config/omf
}


update
install_base
install_fish
