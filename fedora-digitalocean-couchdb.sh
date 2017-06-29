#!/bin/sh

# Fedora 25 Digital Ocean CouchDB Post Install Script

# Install Packages
dnf install couchdb nano npm
npm install -g add-cors-to-couchdb
systemctl start couchdb
systemctl enable couchdb
add-cors-to-couchdb

# Configure DB
HOST="http://127.0.0.1:5984"
curl -X PUT $HOST/_config/admins/admin -d '"password"'
HOST="http://admin:password@127.0.0.1:5984"
curl -X PUT $HOST/taskit
