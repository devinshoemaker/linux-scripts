#!/bin/bash

# Ubuntu - Install Pop!_OS Theme

# Exit immediately if a command exits with a non-zero status
set -e

# Update the user's cached credentials, authenticating the user if necessary
sudo -v

sudo add-apt-repository -y ppa:system76/pop
sudo apt update
sudo apt -y install pop-theme
