#!/bin/bash

ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
hwclock --systohc
sed -i '177s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "BlackBox" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 BlackBox.localdomain BlackBox" >> /etc/hosts
echo root:root | chpasswd

# You can add xorg to the installation packages, I usually add it at the DE or WM install script
# You can remove the tlp package if you are installing on a desktop or vm

pacman -S grub efibootmgr networkmanager network-manager-applet wireless_tools dialog wpa_supplicant mtools dosfstools base-devel linux-headers bluez bluez-utils pulseaudio-bluetooth openssh virt-manager qemu qemu-arch-extra edk2-ovmf os-prober ntfs-3g terminus-font bitwarden zsh

# pacman -S --noconfirm xf86-video-amdgpu
pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable sshd
systemctl enable libvirtd

useradd -m dev 
echo dev:devjoshi | chpasswd
usermod -aG libvirt dev

echo "dev ALL=(ALL) ALL" >> /etc/sudoers.d/dev


printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"




