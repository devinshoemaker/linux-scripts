#!/bin/sh

# Ubuntu Install GitKraken

# Download Package
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb

# Install Package
sudo dpkg -i gitkraken-amd64.deb

# Clean Up
rm gitkraken-amd64.deb
