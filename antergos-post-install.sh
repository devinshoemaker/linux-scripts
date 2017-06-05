#!/bin/sh

# Update packages
yaourt -Syyuu

# Install pacaur
yaourt -S pacaur

# Install fonts
pacaur -S noto-fonts-emoji

# Install user applications
pacaur -S calibre chromium-widevine filezilla google-chrome google-chrome-beta gparted guake imagewriter lm_sensors p7zip simple-scan slack-desktop virtualbox

# Install GDM
pacaur -S gdm &&
sudo systemctl stop lightdm.service &&
sudo systemctl disable lightdm.service &&
sudo systemctl enable gdm.service &&
sudo systemctl start gdm.service &&
pacaur -Rs lightdm

# Development tools
pacaur -S atom android-studio couchdb gitkraken intellij-idea-ultimate-edition jdk8-openjdk maven postgresql smartgit sublime-text &&
sudo systemctl enable couchdb.service &&
sudo systemctl start couchdb.service

# Ionic
sudo npm install -g ionic cordova

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

# Ionic 
mkdir -p ~/Code/ionic &&
cd ~/Code/ionic &&
git clone https://github.com/Dshoe/ionic2-todo.git