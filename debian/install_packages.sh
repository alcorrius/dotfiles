#!/bin/bash

sudo apt update
sudo apt upgrade

sudo apt -y install default-jdk
#sudo apt -y install kdiff3 krusader //KDE
sudo apt -y install freerdp2-x11

### Dbeaver
echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
sudo apt -y install curl gpg gnupg2 software-properties-common apt-transport-https ca-certificates
curl -fsSL https://dbeaver.io/debs/dbeaver.gpg.key | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/dbeaver.gpg
sudo apt update
sudo apt -y install dbeaver-ce

### Sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install sublime-text sublime-merge

# node + jvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
curl -s "https://get.sdkman.io" | bash

sudo apt -y install krita blender


wget https://go.skype.com/skypeforlinux-64.deb
sudo apt install -f ./skypeforlinux-64.deb

sudo apt -y install chromium
sudo apt -y install network-manager-strongswan
