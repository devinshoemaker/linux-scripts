#!/bin/sh

# Install Google Chrome on Fedora 26

# Import Google Keys
sudo rpm --import https://dl-ssl.google.com/linux/linux_signing_key.pub

# Install Chrome RPM
sudo dnf -y install https://dl.google.com/linux/direct/google-chrome-stable_current_$(uname -i).rpm
