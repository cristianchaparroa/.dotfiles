#!/bin/bash

case "$OSTYPE" in
  darwin*)
      echo "MacOS detected..."
      ./macos/install.bash 
      ;; 
  *)    
      echo "unknown: $OSTYPE" 
      echo "anything to install.."
      ;;
esac
