#!/bin/bash
#
# Android Development Environment Tools v0.1130426
# Powered by qaotyk <mayniakgd@gmail.com>
#
# Script to help set up an Android Environment on devices running Ubuntu
# 
# Copyright (c) 2026 qaotyk. All rights reserved.
# This script is licensed under the MIT License.
#

# Check adb command
CHECK_ADB () {
    echo "Checking ADB Utilities: Checking if ADB is installed ..."
    if ! command -v adb >/dev/null 2>&1; then
        echo "Error: ADB not found. Please install ADB and ensure it's in your PATH."
        echo "to install ADB, you can run: sudo apt install adb"
        exit 1
    fi
}

# Launch ADB server
START_ADB () {
    CHECK_ADB
    echo "Start ADB Server ..."
    adb start-server >/dev/null 2>&1
}  

# Check if any Android device is connected
CHECK_DEVICE () {
    START_ADB
    if ! adb get-state >/dev/null 2>&1; then
        echo "Error: No Android device connected. Please connect your device and enable USB debugging."
        exit 1
    fi
}

# Check debugging information of the connected device
GET_DEVICE_INFO () {
    CHECK_DEVICE
    echo "Connected Device Information:"
    adb get-serialno
    echo
}

# Reboot options
REBOOT_BOOTLOADER () {
    CHECK_DEVICE
    echo "Rebooting to Bootloader ..."
    adb reboot bootloader
}

REBOOT_RECOVERY () {
    CHECK_DEVICE
    echo "Rebooting to Recovery ..."
    adb reboot recovery
}

REBOOT_SYSTEM () {
    CHECK_DEVICE
    echo "Rebooting in normal mode ..."
    adb reboot
}

REBOOT_FASTBOOT () {
    CHECK_DEVICE
    echo "Rebooting to Fastboot ..."
    adb reboot fastboot
}
