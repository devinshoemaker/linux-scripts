#!/bin/sh

# Rank mirrors
sudo rm /etc/pacman.d/mirrorlist.backup
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
sudo sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist.backup
sudo rankmirrors -n 6 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist

# Update packages
yaourt -Syyuu

# Install user applications
yaourt -S calibre google-chrome gparted guake filezilla lm_sensors p7zip slack-desktop

# Development tools
yaourt -S atom android-studio gitkraken

# Remove packages
yaourt -Rs chromium chromium-pepper-flash
