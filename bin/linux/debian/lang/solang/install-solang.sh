#!/bin/bash
#
function install_solang() {
    cd ~/src/solang
    $HOME/.cargo/bin/cargo clean -p llvm-sys
    PATH=$PATH:$HOME/src/llvm/llvm-project/installdir/bin/ LLVM_SYS_150_PREFIX=$HOME/src/llvm/llvm-project/installdir/ $HOME/.cargo/bin/cargo build --release 
}
