#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Ankshit | Course: Open Source Software
PACKAGE=$1

# Default to git if no package is provided
if [ -z "$PACKAGE" ]; then
    PACKAGE="git" 
fi

echo "=================================================="
echo " Checking FOSS Package: $PACKAGE"
echo "=================================================="

# Check if package is installed
if command -v dpkg &>/dev/null && dpkg -l "$PACKAGE" &>/dev/null; then
    echo "[+] $PACKAGE is installed."
    # Extract version and description
    dpkg -s "$PACKAGE" | grep -E 'Version|Description' | head -n 2
elif command -v rpm &>/dev/null && rpm -q "$PACKAGE" &>/dev/null; then
    echo "[+] $PACKAGE is installed."
    rpm -qi "$PACKAGE" | grep -E 'Version|License|Summary'
else
    echo "[-] $PACKAGE is NOT installed on this system."
fi

echo "--------------------------------------------------"
echo "FOSS Tool Philosophy:"
# A case statement to print a short description of its purpose
case $PACKAGE in
    httpd|apache2) 
        echo "Apache: The web server that built the open internet." 
        ;;
    mysql|mysql-server|mariadb-server) 
        echo "MySQL/MariaDB: Open source at the heart of millions of dynamic web apps." 
        ;;
    git)
        echo "Git: The tool Linus built when proprietary failed him - decentralizing modern software development."
        ;;
    vlc)
        echo "VLC: A global media player born from a student project."
        ;;
    firefox)
        echo "Firefox: A nonprofit championing an open, accessible web for everyone."
        ;;
    python|python3)
        echo "Python: A language shaped entirely by community."
        ;;
    *)
        echo "An open-source tool serving the greater FOSS ecosystem."
        ;;
esac
echo "=================================================="
