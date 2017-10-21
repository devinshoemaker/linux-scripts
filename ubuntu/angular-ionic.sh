#!/bin/sh

# Ubuntu Install Ionic and Download Source Code

# Update Repositories
sudo apt update

# Install curl
sudo apt -y install curl

# Install Modern Node.js
curl -sL https://deb.nodesource.com/setup_6.x | sudo bash -
sudo apt -y install nodejs

# Install Angular
sudo npm install -g @angular/cli

# Install Ionic and Cordova
sudo npm install -g ionic cordova

# Download Angular Source Code
mkdir -p ~/code/angular
cd ~/code/angular

# Download Ionic Source Code
mkdir -p ~/code/ionic
cd ~/code/ionic

git clone https://github.com/dshoe/taskit-ionic.git
sudo npm install -g add-cors-to-couchdb
sudo systemctl start couchdb
add-cors-to-couchdb
sudo systecmctl stop couchdb

git clone https://github.com/dshoe/coinbase-profit.git
