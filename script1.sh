#!/bin/bash
# Script 1: System Identity Report
# Author: Manav | Course: Open Source Software

# -------------------------------
# SECTION 1: Variable Declaration
# -------------------------------

# Store student name
STUDENT_NAME="Manav"

# Store selected open-source software
SOFTWARE_CHOICE="Git"


# -------------------------------
# SECTION 2: Fetch System Details
# -------------------------------

# Get Linux kernel version using uname command
KERNEL=$(uname -r)

# Get current logged-in username
USER_NAME=$(whoami)

# Get system uptime in human-readable format (e.g., "up 2 hours")
UPTIME=$(uptime -p)


# -----------------------------------------------
# SECTION 3: Detect Linux Distribution (Fallback)
# -----------------------------------------------

# Check if /etc/os-release file exists (standard file for OS info)
if [ -f /etc/os-release ]; then
    # Extract PRETTY_NAME field (user-friendly OS name)
    # Steps:
    # 1. Read file
    # 2. Filter PRETTY_NAME line
    # 3. Extract value after '='
    # 4. Remove double quotes
    DISTRO=$(cat /etc/os-release | grep -w "PRETTY_NAME" | cut -d '=' -f 2 | tr -d '"')
else
    # Fallback value if file is missing
    DISTRO="Linux Distribution"
fi


# -------------------------------
# SECTION 4: Date and Time
# -------------------------------

# Get current date and time in formatted form
# Example: Monday, March 31, 2026 21:30:45
DATE=$(date "+%A, %B %d, %Y %T")


# -------------------------------
# SECTION 5: Display Output
# -------------------------------

# Print header
echo "=================================================="
echo "    Open Source Audit — $STUDENT_NAME"
echo "=================================================="

# Display selected software
echo "Software Choice: $SOFTWARE_CHOICE"

# Display system information
echo "Kernel         : $KERNEL"
echo "Distribution   : $DISTRO"
echo "User           : $USER_NAME"
echo "Uptime         : $UPTIME"
echo "Current Date   : $DATE"

# Print separator
echo "=================================================="

# Display license information about Linux
echo "License Info   : This operating system is powered by the Linux kernel,"
echo "                 released under the GNU General Public License v2 (GPL-2.0)."

# Print closing line
echo "=================================================="
