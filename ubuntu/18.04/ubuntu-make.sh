#!/bin/bash

# Ubuntu - Install Ubuntu Make

# Exit immediately if a command exits with a non-zero status
set -e

# Add Ubuntu Make Repository
sudo add-apt-repository -y ppa:lyzardking/ubuntu-make

# Update Repositories
sudo apt update

# Install Ubuntu Make
sudo apt -y install ubuntu-make
