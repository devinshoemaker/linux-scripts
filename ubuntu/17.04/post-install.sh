#!/bin/sh

# Ubuntu GNOME 17.04 Post Install Script

# Update Packages
sudo apt update
sudo apt -y upgrade

# .bashrc
./bashrc-tweaks.sh

# Install NVIDIA Driver
sudo ubuntu-drivers autoinstall

# Install User Applications
sudo apt -y install gnome-boxes gparted guake network-manager-openvpn-gnome virtualbox xclip

# Autostart Applications
cp -r ../../autostart/ ~/.config/

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
./paper-theme.sh

# Install Development Tools
./development-tools.sh

# Update Packages
sudo apt update
sudo apt -y upgrade

# Remove Packages No Longer Required
sudo apt -y autoremove
