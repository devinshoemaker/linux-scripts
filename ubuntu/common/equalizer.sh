#!/bin/sh

# Ubuntu Install PulseAudio Equalizer

# Update Repositories
sudo apt update

# Install Package
sudo apt install -y pulseaudio-equalizer

# Fix Equalizer
sudo passwd root
su -c 'echo load-module module-equalizer-sink  >> /etc/pulse/default.pa
echo load-module module-dbus-protocol >> /etc/pulse/default.pa'
