#!/bin/bash
# Script 4: Log File Analyzer
# Usage: ./script4.sh /var/log/syslog "error"
# Author: Manav| Course: Open Source Software

LOGFILE=$1
KEYWORD=${2:-"error"} # Default keyword is 'error'
COUNT=0

if [ -z "$LOGFILE" ]; then
    echo "Usage: ./script4.sh <path_to_log_file> [keyword]"
    exit 1
fi

if [ ! -f "$LOGFILE" ]; then
    echo "Error: File $LOGFILE not found."
    exit 1
fi

if [ ! -r "$LOGFILE" ]; then
    echo "Error: Cannot read $LOGFILE. You might need sudo permissions."
    exit 1
fi

# Do-while style retry if the file is empty
while [ ! -s "$LOGFILE" ]; do
    echo "The file $LOGFILE is empty."
    read -p "Would you like to analyze a different file? (Enter path or 'exit'): " LOGFILE
    if [ "$LOGFILE" == "exit" ]; then
        exit 0
    fi
    if [ ! -f "$LOGFILE" ]; then
        echo "Error: File $LOGFILE not found."
        exit 1
    fi
    if [ ! -r "$LOGFILE" ]; then
        echo "Error: Cannot read $LOGFILE. Please try again."
        exit 1
    fi
done

# Read file line by line
while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "=================================================="
echo " Log Analysis Result"
echo "=================================================="
echo "Analyzed File : $LOGFILE"
echo "Keyword       : '$KEYWORD'"
echo "Total Matches : $COUNT"
echo "=================================================="

if [ $COUNT -gt 0 ]; then
    echo "Last 5 occurrences recorded in the log:"
    echo "--------------------------------------------------"
    grep -i "$KEYWORD" "$LOGFILE" | tail -n 5
    echo "=================================================="
fi
