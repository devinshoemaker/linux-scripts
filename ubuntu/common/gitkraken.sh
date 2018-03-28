#!/bin/bash

# Ubuntu Install GitKraken

# Update Repositories
sudo apt update

# Fix Dependencies
sudo apt install -f

# Install Required Dependencies
sudo apt install -y gconf2 gvfs-bin libgnome-keyring0 python

# Download Package
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb

# Install Package
sudo dpkg -i gitkraken-amd64.deb

# Clean Up
rm gitkraken-amd64.deb
