#!/bin/bash
# Script 1: System Identity Report
# Author: Ankshit | Course: Open Source Software
# --- Variables ---
STUDENT_NAME="Ankshit"
SOFTWARE_CHOICE="Git"

# --- System info ---
KERNEL=$(uname -r)
USER_NAME=$(whoami)
UPTIME=$(uptime -p)

# Using a fallback mechanism for distribution name
if [ -f /etc/os-release ]; then
    DISTRO=$(cat /etc/os-release | grep -w "PRETTY_NAME" | cut -d '=' -f 2 | tr -d '"')
else
    DISTRO="Linux Distribution"
fi

DATE=$(date "+%A, %B %d, %Y %T")

# --- Display ---
echo "=================================================="
echo "    Open Source Audit — $STUDENT_NAME"
echo "=================================================="
echo "Software Choice: $SOFTWARE_CHOICE"
echo "Kernel         : $KERNEL"
echo "Distribution   : $DISTRO"
echo "User           : $USER_NAME"
echo "Uptime         : $UPTIME"
echo "Current Date   : $DATE"
echo "=================================================="
echo "License Info   : This operating system is powered by the Linux kernel,"
echo "                 released under the GNU General Public License v2 (GPL-2.0)."
echo "=================================================="
