#!/bin/sh

# Install Flash Plugin on Fedora 26

sudo dnf -y install http://linuxdownload.adobe.com/adobe-release/adobe-release-$(uname -i)-1.0-1.noarch.rpm
sudo rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux
sudo dnf -y install flash-player-ppapi flash-plugin alsa-plugins-pulseaudio libcurl
