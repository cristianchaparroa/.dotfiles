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


function install_go() {
    sudo apt install -y golang
    go install golang.org/x/tools/gopls@latest
}

function install_rust() { 
    echo "#RUST" >> ~/.config/fish/config.fish
    curl https://sh.rustup.rs -sSf | sh -s -- -y 
    echo "fish_add_path $HOME/.cargo/bin" >> ~/.config/fish/config.fish 
    source ~/.config/fish/config.fish

    $HOME/.cargo/bin/rustup component add rls rust-analysis rust-src

    mkdir -p ~/.local/bin 

    mkdir -p ~/.local/bincurl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer

    chmod +x ~/.local/bin/rust-analyzer
    
    source ~/.config/fish/config.fish
}

function main() {
    install_lua
    install_python
    install_go
    install_rust
}

main
