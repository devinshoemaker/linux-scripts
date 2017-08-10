#!/bin/sh

# Ubuntu 16.04/17.04 Post Install Script

# Update Packages
sudo apt -y update &&
sudo apt -y upgrade

# Install User Applications
sudo apt -y install gparted guake

# Install Development Tools
sudo apt -y install couchdb

# Install Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - &&
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' &&
sudo apt -y update &&
sudo apt -y install google-chrome-stable

# Remove Packages No Longer Required
sudo apt -y autoremove
