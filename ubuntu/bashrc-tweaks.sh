#!/bin/sh

# Ubuntu 17.10 .bashrc Tweaks

echo 'alias update="sudo apt update && apt list --upgradable"' >> ~/.bashrc
echo 'alias upgrade="sudo apt -y upgrade && sudo snap refresh"' >> ~/.bashrc
