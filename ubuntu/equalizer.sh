#!/bin/sh

# Ubuntu 17.10 Install PulseAudio Equalizer

sudo apt -y install pulseaudio-equalizer
sudo passwd root
su -c 'echo load-module module-dbus-protocol >> /etc/pulse/default.pa'
