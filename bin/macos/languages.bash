#!/bin/bash

# JAVA

# installing sdkman
# curl -s "https://get.sdkman.io" | bash
# source "$HOME/.sdkman/bin/sdkman-init.sh"

# install the last java
# sdk install java

# install jdt-language server for nvim
JDTL_HOME=~/.config/coc/extensions/coc-java-data/server
JDTL_FILE=jdt-language-server-1.5.0-202109201721.tar.gz 

mkdir -p $JDTL_HOME 
wget https://download.eclipse.org/jdtls/snapshots/${JDTL_FILE} 
cp ${JDTL_FILE} ${JDTL_HOME}
echo ${JDTL_HOME}/${JDTL_FILE}
gunzip -c ${JDTL_HOME}/${JDTL_FILE} | tar xopf -
