#!/bin/sh

# Ubuntu 17.04 Post Install Script

# Update Packages
sudo apt update &&
sudo apt -y upgrade

# Install NVIDIA Driver
sudo ubuntu-drivers autoinstall

# Install User Applications
sudo apt -y install gnome-boxes gparted guake pulseaudio-equalizer virtualbox xclip

# Install Snap Packages
sudo snap install discord

# Install GNOME Shell Extensions
sudo apt -y install gnome-shell-extension-dashtodock gnome-shell-extension-top-icons-plus

# Install Development Tools
./ubuntu/development-tools.sh

# Install Google Chrome
./ubuntu/google-chrome.sh

# Install GitKraken
./ubuntu/gitkraken.sh

# Install Arc Theme
./ubuntu/arc-theme.sh

# Install Paper Theme
./ubuntu/paper-theme.sh

# Update Packages
sudo apt update &&
sudo apt -y upgrade

# Remove Packages No Longer Required
sudo apt -y autoremove

# Install Ionic and Download Source Code
./ubuntu/ionic.sh

# Fix Equalizer
sudo passwd root
su -c 'echo load-module module-equalizer-sink  >> /etc/pulse/default.pa
echo load-module module-dbus-protocol >> /etc/pulse/default.pa'

# .bashrc
./ubuntu/bashrc-tweaks.sh
