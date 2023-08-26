

sudo apt update 
sudo apt upgrade -y
sudo apt -y install pkg-config curl git cmake generate-ninja ninja-build python3

chmod +x pre-requirements.sh
chmod +x install-solang.sh

./pre-requirements.sh
./install-solang.sh
