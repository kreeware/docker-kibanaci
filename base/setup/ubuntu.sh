#!/usr/bin/env bash

set -e

# Install shared utils
apt-get update -y
apt-get install -y \
    sudo \
    software-properties-common \
    python-software-properties
rm -rf /var/lib/apt/lists/*

# Add normal user with passwordless sudo
# From: https://github.com/SeleniumHQ/docker-selenium/blob/910b4f603017bdb422b490ff9a107f4a46c39846/Base/Dockerfile
useradd kibanaci --shell /bin/bash --create-home
usermod -a -G sudo kibanaci
echo 'ALL ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers
echo 'kibanaci:secret' | chpasswd
