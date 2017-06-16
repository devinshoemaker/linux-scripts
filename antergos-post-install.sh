#!/bin/sh

# Update packages
yaourt -Syyuu

# Install pacaur
yaourt -S pacaur

# Install fonts
pacaur -S noto-fonts-emoji

# Install user applications
pacaur -S calibre chromium-widevine filezilla google-chrome google-chrome-beta gparted guake imagewriter lm_sensors p7zip pulseaudio-equalizer simple-scan slack-desktop virtualbox

# GNOME extensions
pacaur -S gnome-shell-extension-topicons gnome-shell-extension-no-topleft-hot-corner

# Development tools
pacaur -S atom android-studio couchdb docker gitkraken intellij-idea-ultimate-edition jdk8-openjdk maven postgresql smartgit sublime-text &&
apm install atom-typescript &&
sudo systemctl enable couchdb.service &&
sudo systemctl start couchdb.service &&
sudo systemctl enable docker.service &&
sudo systemctl start docker.service

# Ionic
sudo npm install -g ionic cordova

# Download source code
# Android
mkdir -p ~/Code/android/examples &&
cd ~/Code/android/examples &&
git clone https://github.com/Dshoe/AndroidExamples-GeoQuiz.git GeoQuiz &&
git clone https://github.com/Dshoe/AndroidExamples-CriminalIntent.git CriminalIntent

# Spring
mkdir -p ~/Code/spring &&
cd ~/Code/spring &&
git clone https://github.com/Dshoe/spring-liquibase-example.git &&
git clone https://github.com/Dshoe/spring-web-db-example.git

# Ionic
mkdir -p ~/Code/ionic &&
cd ~/Code/ionic &&
git clone https://github.com/Dshoe/CloudDo.git

# How to set up PulseAudio Equalizer
sudo nano /etc/pulse/default.pa
# Add '### Load the integrated PulseAudio equalizer and D-Bus module'
# Add 'load-module module-equalizer-sink'
# Add 'load-module module-dbus-protocol'
