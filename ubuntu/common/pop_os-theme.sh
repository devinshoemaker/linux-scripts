#!/bin/bash

# Ubuntu - Install Pop!_OS Theme

# Exit immediately if a command exits with a non-zero status
set -e

sudo add-apt-repository -y ppa:system76/pop
sudo apt update
sudo apt -y install pop-theme
