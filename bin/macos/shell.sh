# install fish
brew install fish

# set as default fish shell
sudo sh -c  'echo /usr/local/bin/fish >> /etc/shells'
sudo chsh -s $(which fish)

# install oh my fish (omf)
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > install
fish install --path=~/.local/share/omf --config=~/.config/oh-my-fish
rm install 

# install fonts 
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh 
cd ..
rm -r fonts
