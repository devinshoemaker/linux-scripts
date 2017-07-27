#!/bin/sh

# Fedora 26 Post Install Script

# Update Packages
sudo dnf upgrade --refresh

# Install Free User Applications
sudo dnf install gnome-tweak-tool gparted guake nano pulseaudio-equalizer simple-scan transmission xclip

# Install Fedy
sudo sh -c 'curl https://www.folkswithhats.org/installer | bash'
