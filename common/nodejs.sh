#!/bin/bash

# Install Node.js

NODEJS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Install Node.js Version Manager
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

# Allow NVM to be Used Without Restarting Bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Install Latest Node.js
nvm install --lts
