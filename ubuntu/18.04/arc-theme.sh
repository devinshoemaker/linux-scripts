#!/bin/bash

# Ubuntu - Install Arc Theme

# Exit immediately if a command exits with a non-zero status
set -e

# Update the user's cached credentials, authenticating the user if necessary
sudo -v

# Add Repository
sudo add-apt-repository -y ppa:noobslab/icons

# Update Repositories
sudo apt update

# Install Theme
sudo apt -y install arc-theme arc-icons
