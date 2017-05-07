#!/bin/sh

# Update packages
yaourt -Syyuu

# Install packer
yaourt -S packer

# Install fonts
packer -S noto-fonts-emoji

# Install user applications
packer -S calibre chromium-widevine filezilla google-chrome google-chrome-beta gparted guake imagewriter jdk8-openjdk lm_sensors p7zip simple-scan slack-desktop

# Development tools
packer -S atom android-studio gitkraken maven

# Download source code
mkdir -p ~/Code/Android/Examples
cd ~/Code/Android/Examples
git clone https://github.com/Dshoe/AndroidExamples-GeoQuiz.git GeoQuiz
git clone https://github.com/Dshoe/AndroidExamples-CriminalIntent.git CriminalIntent
