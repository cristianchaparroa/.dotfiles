#!/bin/bash



# Preparing for lua-language-server compilation and installing
# and support configuration for LSP on Neovim
function install_lua() {
    sudo apt install gcc g++ clang ninja-build -y
    mkdir -p ~/src/lsp
    cd ~/src/lsp
    git clone --depth=1 https://hub.fastgit.xyz/sumneko/lua-language-server
    cd lua-language-server
    git submodule update --init --recursive

    # build on Linux
    cd 3rd/luamake
    compile/install.sh
    cd ../..
    ./3rd/luamake/luamake rebuild

   echo -e "fish_add_path $HOME/src/lsp/lua-language-server/bin \n" >> ~/.config/fish/config.fish 

   source ~/.config/fish/config.fish
}

# support for python on LSP Neovim 
function install_python() {
    sudo apt install python3-pylsp -y
}


function main() {
    install_lua
    install_python
}

main
