#!/bin/bash

# requirements to compile
sudo apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen

# get source code
git clone http://github.com/neovim/neovim

# compile the source
echo "Installing neovim..."

cd neovim && make
sudo make install

echo "nvim installed\n"
./build/bin/nvim --version

echo "Installing Packer..."
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo "clean up"
rm -r neovim/

echo "sync neovim plugins..."
nvim --headless +PackerSync +q
