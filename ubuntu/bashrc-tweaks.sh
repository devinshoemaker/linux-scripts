#!/bin/sh

# .bashrc Tweaks for Ubuntu 17.04

echo alias update='sudo apt update && apt list --upgradable' >> ~/.bashrc
echo 'alias upgrade="sudo apt -y upgrade"' >> ~/.bashrc
