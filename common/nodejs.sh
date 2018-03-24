#!/bin/sh

# Install Node.js

# Install Node.js Version Manager
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

# Allow NVM to be Used Without Restarting Bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Install Latest Node.js
nvm install node

# Instal NPM Check Updates
npm install -g npm-check-updates

# Install Angular
echo '==> Install Angular? (Y/n)'
read ANGULAR
if [ "$ANGULAR" = 'y' ] || [ "$ANGULAR" = 'yes' ] || [ "$ANGULAR" = '' ]; then
    ./angular.sh
else
    echo '==> Skipping Angular.'
fi

# Install Ionic
echo '==> Install Ionic? (Y/n)'
read IONIC
if [ "$IONIC" = 'y' ] || [ "$IONIC" = 'yes' ] || [ "$IONIC" = '' ]; then
    ./ionic.sh
else
    echo '==> Skipping Ionic.'
fi