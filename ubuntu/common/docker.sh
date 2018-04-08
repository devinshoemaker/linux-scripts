#!/bin/bash

# Ubuntu - Install Docker

# Exit immediately if a command exits with a non-zero status
set -e

# Update Repositories
sudo apt update

# Install Package
sudo apt -y install docker.io

# Add User to Docker Group
sudo usermod -aG docker $(whoami)
