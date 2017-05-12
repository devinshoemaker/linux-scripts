#!/bin/sh

# Update packages
yaourt -Syyuu

# Install packer
yaourt -S packer

# Install fonts
packer -S noto-fonts-emoji

# Install user applications
packer -S calibre chromium-widevine filezilla google-chrome google-chrome-beta gparted guake imagewriter lm_sensors p7zip simple-scan slack-desktop

# Development tools
packer -S atom android-studio gitkraken intellij-idea-ultimate-edition jdk8-openjdk maven postgresql sublime-text

# Download source code
# Android
mkdir -p ~/Code/android/examples
cd ~/Code/android/examples
git clone https://github.com/Dshoe/AndroidExamples-GeoQuiz.git GeoQuiz
git clone https://github.com/Dshoe/AndroidExamples-CriminalIntent.git CriminalIntent

# Spring
mkdir -p ~/Code/spring
cd ~/Code/spring
git clone https://github.com/Dshoe/spring-liquibase-example.git
git clone https://github.com/Dshoe/spring-web-db-example.git
