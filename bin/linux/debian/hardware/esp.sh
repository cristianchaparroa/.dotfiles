#!/bin/bash
#
sudo apt -y install gcc git wget make libncurses-dev flex bison gperf python3 python3-serial

mkdir -p ~/src/esp/
cd ~/src/esp

wget https://dl.espressif.com/dl/xtensa-lx106-elf-gcc8_4_0-esp-2020r3-linux-amd64.tar.gz
tar -xzf xtensa-lx106-elf-gcc8_4_0-esp-2020r3-linux-amd64.tar.gz
rm  xtensa-lx106-elf-gcc8_4_0-esp-2020r3-linux-amd64.tar.gz 
echo "XTENSA" >> ~/.profile
echo "PATH=\$PATH:$HOME/src/esp/xtensa-lx106-elf/bin" >> ~/.profile


sudo usermod -a -G dialout $USER
sudo chmod -R 777 /dev/ttyUSB0

