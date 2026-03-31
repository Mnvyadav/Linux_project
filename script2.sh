#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Manav | Course: Open Source Software

# -----------------------------------
# SECTION 1: Input Handling
# -----------------------------------

# Take package name as command-line argument
PACKAGE=$1

# If no package name is provided, default to "git"
if [ -z "$PACKAGE" ]; then
    PACKAGE="git"
fi


# -----------------------------------
# SECTION 2: Display Header
# -----------------------------------

echo "=================================================="
echo " Checking FOSS Package: $PACKAGE"
echo "=================================================="


# -----------------------------------
# SECTION 3: Check Package Installation
# -----------------------------------

# Check if 'dpkg' (Debian-based systems like Ubuntu) is available
# and whether the package is installed
if command -v dpkg &>/dev/null && dpkg -l "$PACKAGE" &>/dev/null; then
    
    echo "[+] $PACKAGE is installed."
    
    # Display package Version and Description
    # grep -E allows multiple patterns
    # head -n 2 ensures only first two matching lines are shown
    dpkg -s "$PACKAGE" | grep -E 'Version|Description' | head -n 2

# Check if 'rpm' (RedHat-based systems like Fedora, CentOS) is available
# and whether the package is installed
elif command -v rpm &>/dev/null && rpm -q "$PACKAGE" &>/dev/null; then
    
    echo "[+] $PACKAGE is installed."
    
    # Display Version, License, and Summary of the package
    rpm -qi "$PACKAGE" | grep -E 'Version|License|Summary'

# If neither package manager finds the package
else
    echo "[-] $PACKAGE is NOT installed on this system."
fi


# -----------------------------------
# SECTION 4: FOSS Philosophy Message
# -----------------------------------

echo "--------------------------------------------------"
echo "FOSS Tool Philosophy:"

# Use case statement to print a short description
# based on the package name
case $PACKAGE in
    
    # Web server packages
    httpd|apache2)
        echo "Apache: The web server that built the open internet."
        ;;
    
    # Database packages
    mysql|mysql-server|mariadb-server)
        echo "MySQL/MariaDB: Open source at the heart of millions of dynamic web apps."
        ;;
    
    # Version control system
    git)
        echo "Git: The tool Linus built when proprietary failed him - decentralizing modern software development."
        ;;
    
    # Media player
    vlc)
        echo "VLC: A global media player born from a student project."
        ;;
    
    # Web browser
    firefox)
        echo "Firefox: A nonprofit championing an open, accessible web for everyone."
        ;;
    
    # Programming language
    python|python3)
        echo "Python: A language shaped entirely by community."
        ;;
    
    # Default case (if package doesn't match any above)
    *)
        echo "An open-source tool serving the greater FOSS ecosystem."
        ;;
esac


# -----------------------------------
# SECTION 5: Footer
# -----------------------------------

echo "=================================================="
