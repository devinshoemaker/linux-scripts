#!/bin/sh

# Fedora 26 Post Install Script

# Update Packages
sudo dnf -y upgrade --refresh

# Install Free User Applications
sudo dnf -y install gnome-tweak-tool gparted guake nano pulseaudio-equalizer simple-scan transmission xclip

# Install GNOME extensions
sudo dnf -y install gnome-shell-extension-no-topleft-hot-corner gnome-shell-extension-simple-dock gnome-shell-extension-topicons-plus

# .bashrc
echo export EDITOR=nano >> ~/.bashrc

# Install Fedy
sudo sh -c 'curl https://www.folkswithhats.org/installer | bash'

# Install Google Chrome
./fedora-install-chrome.sh

# Install GitKraken
./fedora-install-gitkraken.sh

# Install IntelliJ Idea Ultimate
./fedora-install-intelliju.sh

# Install Atom
./fedora-install-atom.sh

# NVIDIA Driver
sudo dnf -y install xorg-x11-drv-nvidia akmod-nvidia "kernel-devel-uname-r == $(uname -r)"

# exFAT Support
sudo dnf -y install fuse-exfat

# Update Packages
sudo dnf -y upgrade --refresh
