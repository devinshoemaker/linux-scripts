#!/bin/sh

# Ubuntu - Install Node.js

# Update Repositories
sudo apt update

# Install curl
sudo apt install -y curl

# Install Modern Node.js
curl -sL https://deb.nodesource.com/setup_9.x | sudo bash -
sudo apt install -y nodejs

# Instal NPM Check Updates
sudo npm install -g npm-check-updates
