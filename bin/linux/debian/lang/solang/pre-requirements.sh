#!/bin/bash

function install_rust() {
    curl https://sh.rustup.rs -sSf | sh -s -- -y 
    sed -i '$d' ~/.profile
    $HOME/.cargo/bin/rustup component add rls rust-analysis rust-src 
    mkdir -p ~/.local/bin 
    mkdir -p ~/.local/bincurl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer

    chmod +x ~/.local/bin/rust-analyzer
}

function install_llvm() {
    apt -y install build-essential libssl-dev
    mkdir -p ~/src/llvm     
    cd  ~/src/llvm

    git clone --depth 1 --branch solana-rustc/15.0-2022-08-09 https://github.com/solana-labs/llvm-project
    cd llvm-project

    cmake -G Ninja -DLLVM_ENABLE_ASSERTIONS=On '-DLLVM_PARALLEL_COMPILE_JOBS=1'  '-DLLVM_ENABLE_PROJECTS=clang;lld'  \
        -DLLVM_ENABLE_TERMINFO=Off -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=installdir -B build llvm
    cmake --build build --target install 
    PATH=$PATH:/usr/bin $HOME/.cargo/bin/cargo install llvmenv
}

function get_solang() {
    cd ~/src/
    /usr/bin/git clone https://github.com/hyperledger/solang/
}

function main() {
    install_rust
    install_llvm
    get_solang
}

main
