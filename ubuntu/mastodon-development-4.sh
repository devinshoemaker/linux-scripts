#!/bin/sh

# Ubuntu 16.04/17.04 Mastodon Install Development Script

# Set Up Database
bundle exec rails db:setup

# Install Foreman
gem install foreman

# Execute webpack
./bin/webpack-dev-server

# You can now Ctrl+C to stop webpack and use '$ foreman start' to run Mastodon
