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

# Add Android Environment Setup: JDK Installation
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
        # Check if OpenJDK 8 is already installed
        if java -version 2>&1 | grep -q "1.8"; then
            echo "OpenJDK 8 is already installed. Skipping installation."
        else
            echo "Installing OpenJDK for Android 7 - 10 (JDK 8)"
            sudo apt install openjdk-8-jdk -y
            echo "Done: OpenJDK 8 installed successfully."
        fi
        break # Installed JDK 8
        ;;
        2)
        # Check if OpenJDK 11 is already installed
        if java -version 2>&1 | grep -q "1.11"; then
            echo "OpenJDK 11 is already installed. Skipping installation."
        else
            echo "Installing OpenJDK for Android 11 - 14+ (JDK 11)"
            sudo apt install openjdk-11-jdk -y
            echo "Done: OpenJDK 11 installed successfully."
        fi
        break # Installed JDK 11
        ;;
        3)
        # Check if OpenJDK 7 is already installed
        if java -version 2>&1 | grep -q "1.7"; then
            echo "OpenJDK 7 is already installed. Skipping installation."
        else
            echo "Installing OpenJDK for Legacy Android 4.4 - 6 (JDK 7)"
            sudo apt install openjdk-7-jdk -y
            echo "Done: OpenJDK 7 installed successfully."
        fi
        break # Installed JDK 7
        ;;
        *)
        echo "Invalid option, please select an Android Build."
        ;;
        esac
done

# Add Android Environment Setup: Repo Installation
echo "Step 2 [2/5]: Setup Android Environment: Installing Repo"
echo "Check if Repo is already installed..."

if command -v repo &> /dev/null; then

    # Check if Repo is in the user's PATH
    if [[ ":$PATH:" == *":$HOME/bin:"* ]]; then
        echo "Repo is already installed and added to PATH. Skipping installation."
    else
    # Add Repo to PATH
        echo "Repo is installed but not in PATH. Adding to PATH."
        if ! grep -q 'export PATH=$HOME/bin:$PATH' ~/.bashrc; then
            echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
            source ~/.bashrc
        fi
        echo "Done: Repo installed and added to PATH successfully."
    fi
else
    echo "Repo not found. Installing Repo"
    mkdir -p ~/bin
    curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
    chmod a+x ~/bin/repo
    # Add Repo to PATH
    echo "Adding Repo to PATH."
    if ! grep -q 'export PATH=$HOME/bin:$PATH' ~/.bashrc; then
        echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
        source ~/.bashrc
    fi
    echo "Done: Repo installed and added to PATH successfully."
fi