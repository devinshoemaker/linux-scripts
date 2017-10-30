#!/bin/sh

# Ubuntu Install Docker

# Update Repositories
sudo apt update

# Install Package
sudo apt install -y docker.io

# Add User to Docker Group
sudo usermod -aG docker $(whoami)
