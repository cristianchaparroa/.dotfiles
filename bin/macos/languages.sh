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
}   


function setup_rust() {
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    rustup component add rls rust-analysis rust-src
}

setup_java
setup_rust

