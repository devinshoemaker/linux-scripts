#!/bin/sh

# Clone Source Code
# Required - Node.js CouchDB

# Add CORS to CouchDB
npm install -g add-cors-to-couchdb
add-cors-to-couchdb

# Create Source Code Directory
mkdir -p ~/code/ionic
cd ~/code/ionic

# Clone Ionic Projects
git clone https://github.com/dshoe/crypto-profit-log.git
git clone https://github.com/dshoe/cube-coach.git
git clone https://github.com/dshoe/taskit-ionic.git
