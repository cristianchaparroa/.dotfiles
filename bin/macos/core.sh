#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install curl
brew install wget
brew install fd
brew install ripgrep
brew install bat 
brew install nvim
brew install gh


brew install neovim
brew upgrade neovim --fetch-HEAD
