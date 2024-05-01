#!/bin/bash

## sys
sudo pacman -S filelight htop
sudo pacman -S zip unzip krusader kdiff3 krename
sudo pacman -S sshfs fuse freerdp

## develop
#sudo pacman -S neovim
#sudo pacman -S geany
yay -S sublime-text-4
yay -S sublime-merge

sudo pacman -S code


curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
curl -s "https://get.sdkman.io" | bash

#configure ssh-agent
echo "SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket" > ~/.bashrc
echo "[Unit]
Description=SSH key agent

[Service]
Type=simple
Environment=SSH_AUTH_SOCK=%t/ssh-agent.socket
# DISPLAY required for ssh-askpass to work
Environment=DISPLAY=:0
ExecStart=/usr/bin/ssh-agent -D -a $SSH_AUTH_SOCK

[Install]
WantedBy=default.target" > ~/.config/systemd/user/ssh-agent.service

systemctl --user enable ssh-agent.service

## design

sudo pacman -S krita blender
yay -S blockbench


## www
# for skype
sudo pacman -S gnome-keyring
# skype
yay -S skypeforlinux-stable-bin #needs reboot

yay -S megasync-bin

sudo pacman -S chromium

# vpn
sudo pacman -S networkmanager-strongswan

## fun
sudo pacman -S steam discord

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
# 4 #
# 3D: SideFX Houdini
