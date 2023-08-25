#!/usr/bin/env bash

# Preparing for lua-language-server compilation and installing
# and support configuration for LSP on Neovim
function install_lua() {
    sudo apt install gcc g++ clang ninja-build -y
    mkdir -p ~/src/lsp

    cd ~/src/lsp
    git clone https://github.com/LuaLS/lua-language-server.git
    cd lua-language-server
    git submodule update --init --recursive

    # build on Linux
    cd 3rd/luamake
    compile/install.sh
    cd ../..
    ./3rd/luamake/luamake rebuild

    if [ "$SHELL" == "fish" ]
    then 
        echo -e "fish_add_path $HOME/src/lsp/lua-language-server/bin \n" >> ~/.config/fish/config.fish 
    fi

    if [ "$SHELL" == "/bin/bash" ]
    then 
        echo "export PATH=\$PATH:/src/lsp/lua-language-server" >> ~/.profile
    fi
}

# support for python on LSP Neovim 
function install_python() {
    sudo apt install -y python3-pylsp python3-debugpy
}


function install_go() {
    sudo apt install -y golang delve
    go install golang.org/x/tools/gopls@latest

    if [ "$SHELL" == "fish" ]
    then
        echo  "fish_add_path $HOME/go" >> ~/.config/fish/config.fish 
        echo  "fish_add_path $HOME/go/bin" >> ~/.config/fish/config.fish
    fi

    if [ "$SHELL" == "/bin/bash" ]
    then 
        echo "export PATH=\$PATH:\$HOME/go" >> ~/.profile
        echo "export PATH=\$PATH:\$HOME/go/bin" >> ~/.profile 
    fi
}

function install_rust() {
    curl https://sh.rustup.rs -sSf | sh -s -- -y 
    sed -i '$d' ~/.profile
    $HOME/.cargo/bin/rustup component add rls rust-analysis rust-src 
    mkdir -p ~/.local/bin 
    mkdir -p ~/.local/bincurl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer

    chmod +x ~/.local/bin/rust-analyzer
   
    if [ "$SHELL" == "fish" ]
    then
        echo "#RUST" >> ~/.config/fish/config.fish
        echo "fish_add_path $HOME/.cargo/bin" >> ~/.config/fish/config.fish 
    fi

    if [ "$SHELL" == "/bin/bash" ]
    then
        echo "#RUST" >> ~/.profile
        echo "export PATH=\$PATH:\$HOME/.cargo/bin" >> ~/.profile
    fi
}

function install_solang() {
    mkdir ~/src/llvm     
    cd  ~/src/llvm

    git clone --depth 1 --branch solana-rustc/15.0-2022-08-09 https://github.com/solana-labs/llvm-project
    cd llvm-project

    cmake -G Ninja -DLLVM_ENABLE_ASSERTIONS=On '-DLLVM_ENABLE_PROJECTS=clang;lld'  \
        -DLLVM_ENABLE_TERMINFO=Off -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=installdir -B build llvm
    cmake --build build --target install 
     
    if [ "$SHELL" == "fish" ]
    then
        echo -e "fish_add_path $HOME/src/llvm/llvm-project/installdir/bin/ \n" >> ~/.config/fish/config.fish
    fi
    if [ "$SHELL" == "/bin/bash" ]
    then
        export PATH=\$HOME/src/llvm/llvm-project/bin:\$PATH
         export PATH=\$HOME/src/llvm/llvm-project/bin:\$PATH >> ~/.profile
    fi
}
function install_c() {
    sudo apt install -y clangd lldb-14 liblldb-dev glibc-source cppman
}

function install_node() {
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    if [ "$SHELL" == "fish" ]
    then
        echo "fish_add_path $HOME/.nvm" >> ~/.config/fish/config.fish
        source ~/.config/fish/config.fish
        omf install nvm
    fi 

    if [ "$SHELL" == "/bin/bash" ]
    then
        echo "#NODE" >> ~/.profile
        echo "export NVM_DIR=\$HOME/.nvm" >> ~/.profile
        echo -e '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm' >> ~/.profile
        echo -e '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' >> ~/.profile
        source ~/.profile
    fi
    
    nvm install lts/gallium 
    npm install -g yarn
}

function main() {
    install_lua
    install_python
    install_c
    install_go
    install_rust
    # install_solang
    install_node
    if [ "$SHELL" == "fish" ]
    then 
      source ~/.config/fish/config.fish 
    fi
    
    if [ "$SHELL" == "/bin/bash" ]
    then
        source ~/.profile
    fi
}

main
