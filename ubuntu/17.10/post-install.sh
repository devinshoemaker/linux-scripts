#!/bin/sh

# Ubuntu 17.10 Post Install Script

# Update Packages
sudo apt update
sudo apt -y upgrade

# .bashrc
./bashrc-tweaks.sh

# Install NVIDIA Driver
# Default free driver runs well.
#sudo ubuntu-drivers autoinstall

# Install User Applications
sudo apt -y install exfat-fuse gnome-boxes gnome-session gparted guake network-manager-openvpn-gnome virtualbox xclip

# Restart Network Service
sudo /etc/init.d/networking restart

# Install Snap Packages
sudo snap install discord

# Install GNOME Shell Extensions
sudo apt -y install gnome-shell-extension-dashtodock gnome-shell-extension-top-icons-plus

# Install Equalizer
./equalizer.sh

# Install Google Chrome
./google-chrome.sh

# Install Arc Theme
./arc-theme.sh

# Install Paper Theme
# 17.10 package not available.
#./paper-theme.sh

# Install Development Tools
./development-tools.sh

# Update Packages
sudo apt update
sudo apt -y upgrade

# Remove Packages No Longer Required
sudo apt -y autoremove

# Change GDM Theme
sudo update-alternatives --config gdm3.css