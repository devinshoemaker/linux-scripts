#!/bin/bash

# Ubuntu - GRUB Tweaks

# Remeber Last Selection
sudo sh -c 'echo "GRUB_DEFAULT=saved" >> /etc/default/grub'
sudo sh -c 'echo "GRUB_SAVEDEFAULT=true" >> /etc/default/grub'

# Update GRUB
sudo update-grub
