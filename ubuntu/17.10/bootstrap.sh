#!/bin/sh

# Ubuntu 17.10 - Bootstrap

# Update Packages
sudo apt update
sudo apt upgrade -y

# Set root password
sudo passwd root

# Disable Universal Time Clock
# fixes time difference in Windows
timedatectl set-local-rtc 1 --adjust-system-clock

# GNOME Shell Tweaks
./gnome-tweaks.sh

# .bashrc
./../common/bashrc-tweaks.sh

# Install NVIDIA Driver
sudo ubuntu-drivers autoinstall

# Install User Applications
sudo apt install -y exfat-fuse gimp gnome-boxes gparted guake virtualbox xclip

# Install User Oriented Snaps
./../common/user-snaps.sh

# Install Google Chrome
./../common/google-chrome.sh

# Install Etcher
./../common/etcher.sh

# Autostart Applications
cp -r ../../autostart/ ~/.config/

# Install Equalizer
./../common/equalizer.sh

# Install Development Tools
./development-tools.sh

# GRUB Tweaks
./../common/grub-tweaks.sh

# Remove Packages No Longer Required
sudo apt autoremove -y
