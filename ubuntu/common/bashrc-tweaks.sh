#!/bin/bash

# Ubuntu - .bashrc Tweaks

# Exit immediately if a command exits with a non-zero status
set -e

echo '' >> ~/.bashrc
echo 'alias update="sudo apt update && apt list --upgradable"' >> ~/.bashrc
echo 'alias upgrade="sudo apt -y upgrade && sudo snap refresh && npm update -g"' >> ~/.bashrc
