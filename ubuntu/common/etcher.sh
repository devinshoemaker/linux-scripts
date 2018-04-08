#!/bin/bash

# Ubuntu - Install Etcher

# Exit immediately if a command exits with a non-zero status
set -e

echo "deb https://dl.bintray.com/resin-io/debian stable etcher" | sudo tee /etc/apt/sources.list.d/etcher.list
sudo apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 379CE192D401AB61
sudo apt update
sudo apt -y install etcher-electron
