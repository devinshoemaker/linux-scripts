#!/bin/sh

# Ubuntu Install Arc Theme

# Add Repositories
sudo add-apt-repository ppa:noobslab/themes
sudo add-apt-repository -y ppa:noobslab/icons

# Update Repositories
sudo apt update

# Install Theme
sudo apt -y install arc-theme arc-icons
