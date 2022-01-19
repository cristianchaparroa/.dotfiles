#!/bin/bash

# install all the plugins on nvim
nvim --headless +PackerSync +q 
nvim --headless +CocInstall coc-java
nvim --headless +CocCommand java.updateLanguageServer 
