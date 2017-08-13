#!/bin/sh

# Ubuntu 16.04/17.04 Mastodon Install Development Script

# Check if rbenv is correctly installed
type rbenv
# Install ruby-build as rbenv plugin
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

# Install and Enable Ruby 2.4.1
rbenv install 2.4.1
rbenv global 2.4.1
