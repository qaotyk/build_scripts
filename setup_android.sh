#!/bin/bash

# Update Ubuntu system
echo " Script Environment: Ubuntu 22.04 LTS"
echo " Initial setup for Android Development Environment"
echo "Powered by qaotyk"

# Update package lists
echo "Updating your system packages..."
sudo apt update

# Upgrade installed packages
echo "Upgrading installed packages..."
sudo apt upgrade -y

# Clean up automatically packages list
echo "Cleaning up automatically installed packages..."
sudo apt autoclean
sudo apt autoremove -y

# Finish MOD: Update System
echo "System update completed!"
