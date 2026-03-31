#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Manav | Course: Open Source Software

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "=================================================="
echo " Directory Audit Report"
echo "=================================================="

for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        SIZE=$(du -sh "$DIR" 2>/dev/null | awk '{print $1}')
        echo "Dir: $DIR"
        echo " -> Permissions: $PERMS"
        echo " -> Size: $SIZE"
        echo "--------------------------------------------------"
    else
        echo "Dir: $DIR does not exist on this system."
        echo "--------------------------------------------------"
    fi
done

echo "=================================================="
echo " Software Specific Config Check (Git)"
echo "=================================================="

GIT_CONFIG="/etc/gitconfig"
if [ -f "$GIT_CONFIG" ]; then
    GIT_PERMS=$(ls -ld "$GIT_CONFIG" | awk '{print $1, $3, $4}')
    echo "[FOUND] System-wide config: $GIT_CONFIG"
    echo "        Permissions: $GIT_PERMS"
else
    echo "[MISSING] System-wide $GIT_CONFIG does not exist."
fi

GIT_USER_CONFIG="$HOME/.gitconfig"
if [ -f "$GIT_USER_CONFIG" ]; then
    GIT_USER_PERMS=$(ls -ld "$GIT_USER_CONFIG" | awk '{print $1, $3, $4}')
    echo "[FOUND] User config: $GIT_USER_CONFIG"
    echo "        Permissions: $GIT_USER_PERMS"
else
    echo "[MISSING] User $GIT_USER_CONFIG does not exist."
fi
echo "=================================================="
