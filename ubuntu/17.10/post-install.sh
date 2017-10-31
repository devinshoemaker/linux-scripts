#!/bin/sh

# Ubuntu 17.10 Post Install Script

# Update Packages
sudo apt update
sudo apt upgrade -y

# .bashrc
./bashrc-tweaks.sh

# Install NVIDIA Driver
sudo ubuntu-drivers autoinstall

# Install User Applications
sudo apt install -y exfat-fuse gnome-boxes gnome-session gparted guake network-manager-openvpn-gnome virtualbox xclip

# Autostart Applications
cp -r ../../autostart/ ~/.config/

# Restart Network Service
sudo /etc/init.d/networking restart

# Install Snap Packages
sudo snap install discord

# Install GNOME Shell Extensions
sudo apt install -y gnome-shell-extensions gnome-shell-extension-dashtodock gnome-shell-extension-top-icons-plus

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

# Remove Packages No Longer Required
sudo apt autoremove -y

# Change GDM Theme
sudo update-alternatives --config gdm3.css
