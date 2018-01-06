#!/bin/sh

# Ubuntu GNOME 16.04 Post Install Script

# Update Packages
sudo apt update
sudo apt upgrade -y

# GNOME Shell Tweaks
./gnome-tweaks.sh

# .bashrc
./../common/bashrc-tweaks.sh

# Install NVIDIA Driver
sudo ubuntu-drivers autoinstall

# Install User Applications
sudo apt install -y gnome-boxes gparted guake virtualbox xclip

# Install Google Chrome
./../common/google-chrome.sh

# Install Snap Packages
#sudo snap install discord

# Autostart Applications
cp -r ../../autostart/ ~/.config/

# Install Equalizer
./equalizer.sh

# Install Development Tools
./development-tools.sh

# Remove Packages No Longer Required
sudo apt autoremove -y
