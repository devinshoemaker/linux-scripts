#!/bin/sh

# Ubuntu - Install Angular and Download Source Code
# Node.js Required

# Install Angular
npm install -g @angular/cli

# Download Angular Source Code
mkdir -p ~/code/angular
cd ~/code/angular

git clone https://github.com/Dshoe/angular-tour-of-heroes
