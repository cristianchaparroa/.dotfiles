#!/bin/bash
#
function setup_rust() {
    rustup update stable
    rustup install 1.69
    rustup default 1.69
    rustup component add rust-src --toolchain 1.69
    rustup target add wasm32-unknown-unknown --toolchain 1.69
}

function install_deps() {
    sudo apt-get update
    sudo apt-get -y install binaryen
    cargo install cargo-dylint dylint-link
    cargo install --git https://github.com/paritytech/cargo-contract --locked --tag v2.2.1 --force
}

function install_swanky_cli() {
    npm install -g @astar-network/swanky-cli
}

function install_swanky_node() {
    mkdir -p ~/src/swanky_node
    cd ~/src/swanky_node/
    wget https://github.com/swankyhub/swanky-node/releases/download/v1.6.0/swanky-node-v1.6.0-ubuntu-x86_64.tar.gz
    tar -xvf swanky-node-v1.6.0-ubuntu-x86_64.tar.gz
    rm swanky-node-v1.6.0-ubuntu-x86_64.tar.gz
    echo "export PATH=\$HOME/src/swanky_node:\$PATH" >> ~/.profile
}

function setup_ink_environment() {
    setup_rust
    install_deps
    install_swanky_cli
    install_swanky_node
}

setup_ink_environment
