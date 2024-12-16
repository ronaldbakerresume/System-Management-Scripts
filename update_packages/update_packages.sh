#!/bin/bash

# Detect the package manager
if command -v apt &> /dev/null; then
    PACKAGE_MANAGER="apt"
elif command -v yum &> /dev/null; then
    PACKAGE_MANAGER="yum"
elif command -v dnf &> /dev/null; then
    PACKAGE_MANAGER="dnf"
else
    echo "No supported package manager found (apt, yum, dnf)."
    exit 1
fi

# Log file for the update process
LOGFILE="$HOME/package_update_$(date '+%Y%m%d_%H%M%S').log"

echo "Using package manager: $PACKAGE_MANAGER"
echo "Updating system packages... (Log: $LOGFILE)"

# Perform the update based on the detected package manager
if [ "$PACKAGE_MANAGER" = "apt" ]; then
    sudo apt update >> "$LOGFILE" 2>&1
    sudo apt upgrade -y >> "$LOGFILE" 2>&1
    sudo apt autoremove -y >> "$LOGFILE" 2>&1
    sudo apt clean >> "$LOGFILE" 2>&1
elif [ "$PACKAGE_MANAGER" = "yum" ] || [ "$PACKAGE_MANAGER" = "dnf" ]; then
    sudo $PACKAGE_MANAGER update -y >> "$LOGFILE" 2>&1
    sudo $PACKAGE_MANAGER autoremove -y >> "$LOGFILE" 2>&1
    sudo $PACKAGE_MANAGER clean all >> "$LOGFILE" 2>&1
fi

# Confirm completion
if [ $? -eq 0 ]; then
    echo "System update completed successfully. See $LOGFILE for details."
else
    echo "System update failed. Check $LOGFILE for errors."
fi

