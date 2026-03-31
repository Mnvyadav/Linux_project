#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Manav | Course: Open Source Software

# -----------------------------------
# SECTION 1: Directory List
# -----------------------------------

# Array of important system directories to audit
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")


# -----------------------------------
# SECTION 2: Header Display
# -----------------------------------

echo "=================================================="
echo " Directory Audit Report"
echo "=================================================="


# -----------------------------------
# SECTION 3: Loop Through Directories
# -----------------------------------

# Iterate over each directory in the DIRS array
for DIR in "${DIRS[@]}"; do
    
    # Check if directory exists
    if [ -d "$DIR" ]; then
        
        # Get permissions, owner, and group using ls -ld
        # awk extracts:
        # $1 → permissions (e.g., drwxr-xr-x)
        # $3 → owner
        # $4 → group
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        
        # Get total size of directory in human-readable format
        # 'du -sh' → summary + human-readable
        # '2>/dev/null' suppresses permission errors
        SIZE=$(du -sh "$DIR" 2>/dev/null | awk '{print $1}')
        
        # Display directory details
        echo "Dir: $DIR"
        echo " -> Permissions: $PERMS"
        echo " -> Size: $SIZE"
        echo "--------------------------------------------------"
    
    else
        # If directory does not exist
        echo "Dir: $DIR does not exist on this system."
        echo "--------------------------------------------------"
    fi
done


# -----------------------------------
# SECTION 4: Git Configuration Check
# -----------------------------------

echo "=================================================="
echo " Software Specific Config Check (Git)"
echo "=================================================="


# -------------------------------
# Check System-wide Git Config
# -------------------------------

# Path to system-wide Git configuration file
GIT_CONFIG="/etc/gitconfig"

# Check if file exists
if [ -f "$GIT_CONFIG" ]; then
    
    # Extract permissions, owner, and group
    GIT_PERMS=$(ls -ld "$GIT_CONFIG" | awk '{print $1, $3, $4}')
    
    echo "[FOUND] System-wide config: $GIT_CONFIG"
    echo "        Permissions: $GIT_PERMS"
else
    echo "[MISSING] System-wide $GIT_CONFIG does not exist."
fi


# -------------------------------
# Check User-level Git Config
# -------------------------------

# Path to user-specific Git configuration file
GIT_USER_CONFIG="$HOME/.gitconfig"

# Check if file exists
if [ -f "$GIT_USER_CONFIG" ]; then
    
    # Extract permissions, owner, and group
    GIT_USER_PERMS=$(ls -ld "$GIT_USER_CONFIG" | awk '{print $1, $3, $4}')
    
    echo "[FOUND] User config: $GIT_USER_CONFIG"
    echo "        Permissions: $GIT_USER_PERMS"
else
    echo "[MISSING] User $GIT_USER_CONFIG does not exist."
fi


# -----------------------------------
# SECTION 5: Footer
# -----------------------------------

echo "=================================================="
