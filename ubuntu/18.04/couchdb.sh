#!/bin/bash

# Ubuntu 18.04 - Install CouchDB

# Exit immediately if a command exits with a non-zero status
set -e

# Update the user's cached credentials, authenticating the user if necessary
sudo -v

echo "==> Installing CouchDB..."

if ! command -v curl >/dev/null 2>&1 ; then
    echo "==> curl not found. Installing now..."
    sudo apt -y install curl
fi

# Add Repository
echo "deb https://apache.bintray.com/couchdb-deb bionic main" \
    | sudo tee -a /etc/apt/sources.list

# Install Repository Key
curl -L https://couchdb.apache.org/repo/bintray-pubkey.asc \
    | sudo apt-key add -

# Update Repositories
sudo apt update

# Install CouchDB
sudo apt -y install couchdb
