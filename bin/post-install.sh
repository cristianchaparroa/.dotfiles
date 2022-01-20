#!/bin/bash

echo "Post install script ..."

# install all the plugins on nvim
echo "sync neovim plugins..."
nvim --headless +PackerSync +q

echo "installing coc-java..."
nvim --headless +CocInstall coc-java +q
nvim --headless +CocCommand java.updateLanguageServer  +q


echo "installing coc-rls..."
nvim --headless +CocInstall coc-rls +q
nvim --headless +CocInstall coc-rust-analyzer +q

echo "Finished successfully"
