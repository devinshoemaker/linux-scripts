#!/bin/sh

# Ubuntu Install CouchDB Docker Container

# Pull CouchDB Docker Image
docker pull couchdb

# Create CouchDB Docker Container
docker run -d --name couchdb couchdb
