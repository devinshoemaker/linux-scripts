#!/bin/sh

# Install Apache
sudo apt -y install apache2

# Disable Apache Service by Default
sudo systemctl stop apache2
sudo systemctl disable apache2
