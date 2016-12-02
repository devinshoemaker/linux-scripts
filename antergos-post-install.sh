#!/bin/sh

# Rank mirrors
#sudo rm /etc/pacman.d/mirrorlist.backup
#sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
#sudo sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist.backup
#sudo rankmirrors -n 6 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist

# Update packages
yaourt -Syyuu

# Install fonts
yaourt -S noto-fonts-emoji

# Install user applications
yaourt -S calibre filezilla google-chrome gparted guake imagewriter lm_sensors p7zip slack-desktop
yaourt -S calibre filezilla google-chrome gparted guake imagewriter jdk8-openjdk lm_sensors p7zip slack-desktop

# Development tools
yaourt -S atom android-studio gitkraken

# Remove packages
#yaourt -Rs chromium chromium-pepper-flash

# Download source code
mkdir -p ~/Code/Android/Examples
cd ~/Code/Android/Examples
git clone https://github.com/Dshoe/AndroidExamples-GeoQuiz.git GeoQuiz
git clone https://github.com/Dshoe/AndroidExamples-CriminalIntent.git CriminalIntent
