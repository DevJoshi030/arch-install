#!/bin/bash

sudo timedatectl set-ntp true
sudo hwclock --systohc

git clone https://aur.archlinux.org/pikaur.git
cd pikaur/
makepkg -si --noconfirm

#pikaur -S --noconfirm system76-power
#sudo systemctl enable --now system76-power
#sudo system76-power graphics integrated
#pikaur -S --noconfirm auto-cpufreq
#sudo systemctl enable --now auto-cpufreq


sudo pacman -S --noconfirm xorg sddm plasma kde-applications firefox vlc papirus-icon-theme materia-kde

pikaur -S ttf-ms-fonts

sudo systemctl enable sddm

balooctl disable
balooctl purge
balooctl status

/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
sleep 5
reboot
