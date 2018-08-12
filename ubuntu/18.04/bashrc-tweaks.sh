#!/bin/bash

# Ubuntu - .bashrc Tweaks

# Exit immediately if a command exits with a non-zero status
set -e

# Update the user's cached credentials, authenticating the user if necessary
sudo -v

echo '' >> ~/.bashrc
echo 'alias update="sudo apt update && apt list --upgradable"' >> ~/.bashrc
echo 'alias upgrade="sudo apt -y full-upgrade"' >> ~/.bashrc
