#!/bin/sh

# Ubuntu 17.04 Install Ionic and Download Source Code

# Update Repositories
sudo apt update

# Install curl
sudo apt -y install curl

# Install Modern Node.js
curl -sL https://deb.nodesource.com/setup_6.x | sudo bash -
sudo apt -y install nodejs

# Install Ionic and Cordova
sudo npm install -g ionic cordova

# Download Source Code
mkdir -p ~/code/ionic
cd ~/code/ionic

git clone https://github.com/dshoe/taskit-ionic.git
sudo npm install -g add-cors-to-couchdb
sudo systemctl start couchdb
add-cors-to-couchdb
sudo systecmctl stop couchdb

git clone https://github.com/dshoe/coinbase-profit.git
