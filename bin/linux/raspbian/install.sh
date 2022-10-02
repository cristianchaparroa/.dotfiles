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


update
install_base
