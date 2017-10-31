#!/bin/sh

# Ubuntu 17.10 Install GitKraken

# Update Repositories
sudo apt update

# Install Required Dependencies
sudo apt install -y gconf2 python

# Download Package
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb

# Install Package
sudo dpkg -i gitkraken-amd64.deb

# Clean Up
rm gitkraken-amd64.deb
