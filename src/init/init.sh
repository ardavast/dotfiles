#!/bin/sh -ex
sudo apt update
sudo apt -y upgrade

# Chrome
wget -P /tmp/ https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt -y install /tmp/google-chrome-stable_current_amd64.deb
rm /tmp/google-chrome-stable_current_amd64.deb

# Python
sudo apt -y install python3-tk
sudo apt -y install ipython ipython3
sudo apt -y install python-pip python3-pip

pip install --upgrade pip
sudo sed -i 's/from pip import main/from pip._internal import main/' /usr/bin/pip
sudo sed -i 's/from pip import main/from pip._internal import main/' /usr/bin/pip2
sudo sed -i 's/from pip import main/from pip._internal import main/' /usr/bin/pip3

pip install --user --upgrade virtualenv
pip install --user --upgrade cryptography matplotlib numpy pandas pwntools \
                             pygame scapy scipy 
pip3 install --user --upgrade cryptography matplotlib numpy pandas pwntools \
                              pygame scapy-python3 scipy 

# JDK
sudo apt-add-repository -y ppa:webupd8team/java
sudo apt update
echo 'debconf shared/accepted-oracle-license-v1-1 select true' | sudo debconf-set-selections
sudo apt -y install oracle-java8-installer

# Software
echo 'debconf wireshark-common/install-setuid boolean true' | sudo debconf-set-selections
sudo apt -y install build-essential cloc curl devscripts git gnuradio gpick  \
                    gr-osmosdr htop libosmosdr-dev libosmosdr0 osmo-sdr      \
                    powerline rpm rtl-sdr silversearcher-ag splint tcpreplay \
                    tmux vim wireshark xcape yasm zsh

# Dotfiles
# https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
git clone --bare https://github.com/ardavast/dotfiles.git ~/src/dotfiles
alias dotgit='/usr/bin/git --git-dir=$HOME/src/dotfiles --work-tree=$HOME'
dotgit remote set-url origin git@github.com:ardavast/dotfiles.git
dotgit checkout
dotgit config --local status.showUntrackedFiles no
dotgit update-index --assume-unchanged ~/README.md
rm ~/README.md
dotgit update-index --assume-unchanged ~/LICENSE
rm ~/LICENSE

# Oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
sudo chsh -s /bin/zsh ardavast

# Vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
