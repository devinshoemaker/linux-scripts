#!/bin/bash

# Ubuntu - Install PulseAudio Equalizer

# Exit immediately if a command exits with a non-zero status
set -e

# Update the user's cached credentials, authenticating the user if necessary
sudo -v

# Update Repositories
sudo apt update

# Install Package
sudo apt -y install pulseaudio-equalizer

# Fix Equalizer
su -c 'echo load-module module-equalizer-sink  >> /etc/pulse/default.pa
echo load-module module-dbus-protocol >> /etc/pulse/default.pa'
