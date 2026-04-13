#!/bin/bash

# Update Ubuntu system
echo " Script Environment: Ubuntu 22.04 LTS"
echo " Initial setup for Android Development Environment"
echo "Powered by qaotyk"

# Update package lists
echo "Step 1 [1/3]: Update System: Updating your system packages..."
sudo apt update

# Upgrade installed packages
echo "Step 1 [2/3]: Update System: Upgrading installed packages..."
sudo apt upgrade -y

# Clean up automatically packages list
echo "Step 1 [3/3]: Update System: Cleaning up automatically installed packages..."
sudo apt autoclean
sudo apt autoremove -y

# Finish MOD: Update System
echo "Done: Update System completed!"

# Add Android Environment Setup
echo "Step 2 [1/5]: Setup Android Environment: Installing JDK"
sudo apt install openjdk-11-jdk -y
if [ $? -ne 1 ]; then
    echo "Done: JDK installed successfully!"
else
    echo "Error: Failed to install JDK."
    clear
    echo "Aborting setup in Step 2 [1/5]. Fix the error and run the script again."
    exit 1
fi
