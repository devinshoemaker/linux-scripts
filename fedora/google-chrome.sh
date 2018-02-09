#!/bin/sh

# Fedora - Install Google Chrome

# Import Google Public Keys
sudo rpm --import https://dl-ssl.google.com/linux/linux_signing_key.pub

# Install Google Chrome
sudo dnf install -y https://dl.google.com/linux/direct/google-chrome-stable_current_$(uname -i).rpm
