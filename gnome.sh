#!/bin/bash

sudo timedatectl set-ntp true
sudo hwclock --systohc

git clone https://aur.archlinux.org/pikaur.git
cd pikaur/
makepkg -si --noconfirm

sudo pacman -S --noconfirm xorg gdm gnome gnome-extra firefox gnome-tweaks vlc

pikaur -S ttf-ms-fonts

# sudo flatpak install -y spotify
# sudo flatpak install -y kdenlive

sudo systemctl enable gdm
/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
sleep 5
sudo reboot
