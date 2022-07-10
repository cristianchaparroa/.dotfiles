#!/bin/bash

# JAVA
function setup_java() {
    # installing sdkman
    curl -s "https://get.sdkman.io" | bash
    source "$HOME/.sdkman/bin/sdkman-init.sh"

    # install the last java
    sdk install java 17.0.1-oracle

    # install jdt-language server for coc-java
    JDTL_HOME=~/.config/coc/extensions/coc-java-data/server
    JDTL_FILE=jdt-language-server-1.5.0-202109201721.tar.gz 


    rm -r ${JDTL_HOME}
    mkdir -p $JDTL_HOME 
    
    wget https://download.eclipse.org/jdtls/snapshots/${JDTL_FILE} 

    mv ${JDTL_FILE} ${JDTL_HOME}
    cd ${JDTL_HOME}

    tar -zxvf ${JDTL_FILE}
    rm ${JDTL_FILE}
    cd

    # install lombok
    LOMBOK_HOME=~/.local/share/lombok 
    mkdir -p ${LOMBOK_HOME}

    wget https://projectlombok.org/downloads/lombok.jar -O ${LOMBOK_HOME}/lombok.jar
    cd

    echo "# JAVA" >> ~/.config/fish/config.fish
    echo "set JDTLS_HOME ~/.config/lsp/nvim-jdtls/serverset"
}   


function setup_rust() {
    echo "#RUST" >> ~/.config/fish/config.fish

    curl https://sh.rustup.rs -sSf | sh -s -- -y 
    echo "fish_add_path $HOME/.cargo/bin" >> ~/.config/fish/config.fish 
    source ~/.config/fish/config.fish

    $HOME/.cargo/bin/rustup component add rls rust-analysis rust-src
    brew install rust-analyzer

    echo "fish_add_path /opt/hombrew/Cellar/lua-language-server" >> ~/.config/fish/config.fish
}

function setup_lua() {
    brew install lua-language-server
    
    echo "# LUA" >> ~/.config/fish/config.fish
    echo "fish_add_path /opt/homebrew/Cellar/lua-language-server"
}

function setup_python() {
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py 
    python3 get-pip.py 

    pip3 install -U setuptools
    pip3 install python-lsp-server
    pip3 install "python-lsp-server[all]"

    rm get-pip.py
}

function setup_typescript() {
    omf install nvm 
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    echo "set -gx NVM_DIR ~/.nvm" >> ~/.config/fish/config.fish

    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

    nvm install node
    npm install -g typescript typescript-language-server eslint prettier
    npm install -g eslint_d
}

setup_java
setup_rust
setup_lua
setup_python
setup_typescript
