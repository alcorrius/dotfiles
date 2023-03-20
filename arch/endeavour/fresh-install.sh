#!/bin/bash

## sys
sudo pacman -S ksysguard filelight
sudo pacman -S zip unzip

## edit
#sudo pacman -S neovim
#sudo pacman -S geany
yay -S sublime-text-4
yay -S sublime-merge

sudo pacman -S code


## develop

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
curl -s "https://get.sdkman.io" | bash


## www
# for skype
sudo pacman -S gnome-keyring
# skype
yay -S skypeforlinux-stable-bin #needs reboot


## fun
sudo pacman -S steam

### Manual Section:
# 1 #
# Virtual Desktops: 4
# Screen Edges: No action
# 2 #
# win + t = konsole
# win + w = firefox
# win + f = dolphin
# win + space = switch layout
# 3 #
# widgets : total cpu use, fokus