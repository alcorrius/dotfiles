# Debian 10 Mate
Xeon-Nvidia:
1) get rt2800 (tplink wdn 32000) drivers on FAT32 USB flash
2) install Debian 10 with Mate
3) Fix wi-fi
/etc/NetworkManager/NetworkManager.conf:
[device]
wifi.scan-rand-mac-address=no
3) install Nvidia official drivers
ctrl+alt+f1
sudo init 3
blacklist nouveau
sudo apt remove --purge '^nvidia-.*'
sudo update-initramfs -u
apt install build-essentials linux-headers-`uname -r`
4) fix Tearing
sudo nano /etc/modprobe.d/zz-nvidia-modeset.conf
options nvidia_drm modeset=1
sudo update-initramfs -u
5) fix missing libs
sudo apt install firmware-linux firmware-linux-nonfree
