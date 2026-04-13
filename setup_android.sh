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

# Select JDK version based on Android version
while true; do
    # Open interactive menu
        echo "Select the Android version you want to develop for"
        echo "1. Android 7 - 10 (JDK 8)"
        echo "2. Android 11 - 14+ (JDK 11)"
        echo "3. Legacy Android 4.4 - 6 (JDK 7)"

    # Read user input
        read -p "Enter your choice: " jdk_version

    # Validate user inpuut
        case $jdk_version in
        1)
        echo "Installing OpenJDK for Android 7 - 10 (JDK 8)"
        sudo apt install openjdk-8-jdk -y
        break # Installed JDK 8
        ;;
        2)
        echo "Installing OpenJDK for Android 11 - 14+ (JDK 11)"
        sudo apt install openjdk-11-jdk -y
        break # Installed JDK 11
        ;;
        3)
        echo "Installing OpenJDK for Legacy Android 4.4 - 6 (JDK 7)"
        sudo apt install openjdk-7-jdk -y
        break # Installed JDK 7
        ;;
        *)
        echo "Invalid option, please select an Android Build."
        ;;
        esac
        
done
