#!/bin/bash
# Script 4: Log File Analyzer
# Usage: ./script4.sh /var/log/syslog "error"
# Author: Manav | Course: Open Source Software


# -----------------------------------
# SECTION 1: Input Handling
# -----------------------------------

# First argument → log file path
LOGFILE=$1

# Second argument → keyword to search
# If not provided, default is "error"
KEYWORD=${2:-"error"}

# Initialize counter for matches
COUNT=0


# -----------------------------------
# SECTION 2: Input Validation
# -----------------------------------

# Check if logfile argument is missing
if [ -z "$LOGFILE" ]; then
    echo "Usage: ./script4.sh <path_to_log_file> [keyword]"
    exit 1
fi

# Check if file exists
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File $LOGFILE not found."
    exit 1
fi

# Check if file is readable
if [ ! -r "$LOGFILE" ]; then
    echo "Error: Cannot read $LOGFILE. You might need sudo permissions."
    exit 1
fi


# -----------------------------------
# SECTION 3: Handle Empty File (Retry)
# -----------------------------------

# Loop runs while file is empty (-s checks if file has size > 0)
# This acts like a do-while retry mechanism
while [ ! -s "$LOGFILE" ]; do
    echo "The file $LOGFILE is empty."
    
    # Ask user for another file or exit
    read -p "Would you like to analyze a different file? (Enter path or 'exit'): " LOGFILE
    
    # Exit if user types 'exit'
    if [ "$LOGFILE" == "exit" ]; then
        exit 0
    fi
    
    # Validate new file again
    if [ ! -f "$LOGFILE" ]; then
        echo "Error: File $LOGFILE not found."
        exit 1
    fi
    
    if [ ! -r "$LOGFILE" ]; then
        echo "Error: Cannot read $LOGFILE. Please try again."
        exit 1
    fi
done


# -----------------------------------
# SECTION 4: Analyze Log File
# -----------------------------------

# Read file line by line safely
# IFS= prevents trimming of spaces
# -r prevents backslash interpretation
while IFS= read -r LINE; do
    
    # Check if line contains keyword (case-insensitive)
    # -i → ignore case
    # -q → quiet (no output, just match check)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        
        # Increment match counter
        COUNT=$((COUNT + 1))
    fi

# Input redirection: read from LOGFILE
done < "$LOGFILE"


# -----------------------------------
# SECTION 5: Display Results
# -----------------------------------

echo "=================================================="
echo " Log Analysis Result"
echo "=================================================="

# Show analyzed file and keyword
echo "Analyzed File : $LOGFILE"
echo "Keyword       : '$KEYWORD'"
echo "Total Matches : $COUNT"

echo "=================================================="


# -----------------------------------
# SECTION 6: Show Last 5 Matches
# -----------------------------------

# If at least one match is found
if [ $COUNT -gt 0 ]; then
    echo "Last 5 occurrences recorded in the log:"
    echo "--------------------------------------------------"
    
    # Print last 5 matching lines
    grep -i "$KEYWORD" "$LOGFILE" | tail -n 5
    
    echo "=================================================="
fi
