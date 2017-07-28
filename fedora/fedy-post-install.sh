#!/bin/sh

# Fedora 26 Post Install Script

# Update Packages
sudo dnf upgrade --refresh

# Install Free User Applications
sudo dnf install gnome-tweak-tool gparted guake nano pulseaudio-equalizer simple-scan transmission xclip

# Install GNOME extensions
sudo dnf install gnome-shell-extension-no-topleft-hot-corner gnome-shell-extension-simple-dock gnome-shell-extension-topicons-plus

# .bashrc
echo export EDITOR=nano >> ~/.bashrc

# Install Fedy
sudo sh -c 'curl https://www.folkswithhats.org/installer | bash'

# Install Google Chrome
./fedora-install-chrome.sh

# Install GitKraken
./fedora-install-gitkraken.sh

# NVIDIA Driver
sudo dnf install xorg-x11-drv-nvidia akmod-nvidia "kernel-devel-uname-r == $(uname -r)"

# Update Packages
sudo dnf upgrade --refresh
