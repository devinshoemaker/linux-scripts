#!/bin/sh

# Ubuntu 16.04 Post Install Script

# Update Packages
sudo apt update
sudo apt -y upgrade

# Install NVIDIA Driver
sudo ubuntu-drivers autoinstall

# Install User Applications
sudo apt -y install gnome-boxes gparted guake network-manager-openvpn-gnome virtualbox xclip

# Restart Network Service
sudo /etc/init.d/networking restart

# Install Snap Packages
sudo snap install discord

# Install GNOME Shell Extensions
sudo apt -y install gnome-shell-extension-dashtodock gnome-shell-extension-top-icons-plus

# Install Equalizer
./ubuntu/equalizer.sh

# Install Google Chrome
./ubuntu/google-chrome.sh

# Install Arc Theme
./ubuntu/arc-theme.sh

# Install Paper Theme
./ubuntu/paper-theme.sh

# Install Development Tools
./ubuntu/development-tools.sh

# Update Packages
sudo apt update
sudo apt -y upgrade

# Remove Packages No Longer Required
sudo apt -y autoremove

# Install Ionic and Download Source Code
./ubuntu/ionic.sh

# .bashrc
./ubuntu/bashrc-tweaks.sh
