#!/bin/sh

# Ubuntu 16.04.2 Post Install Script

# Update Packages
sudo apt-get update &&
sudo apt-get upgrade

## Repos

# Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - &&
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' &&

# Install User Applications
sudo apt-get install google-chrome-stable gparted guake
