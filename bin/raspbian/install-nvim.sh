#!/bin/bash

# requirements to compile
sud apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen

# get source code
git clone http://github.com/neovim/neovim

# compile the source
cd neovim && make
sudo make install

echo "nvim installed\n"
./build/bin/nvim --version 

echo "clean up"
rm -r neovim/
