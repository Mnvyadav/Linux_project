#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Manav | Course: Open Source Software


# -----------------------------------
# SECTION 1: Introduction Display
# -----------------------------------

# Print header for the program
echo "=================================================="
echo "     The Open Source Manifesto Generator"
echo "=================================================="

# Instructions for the user
echo "Answer three questions to generate your personalized manifesto."
echo ""


# -----------------------------------
# SECTION 2: User Input
# -----------------------------------

# Take user input using read command
# -p allows prompt message

read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD


# -----------------------------------
# SECTION 3: System Information
# -----------------------------------

# Get current date in format: DD Month YYYY
DATE=$(date '+%d %B %Y')

# Get current username
USER_NAME=$(whoami)

# Output file name (dynamic based on user)
OUTPUT="manifesto_${USER_NAME}.txt"


# -----------------------------------
# SECTION 4: Alias Concept (Commented)
# -----------------------------------

# Example of alias (not executed, just demonstration)
# alias read_manifesto="cat $OUTPUT"


# -----------------------------------
# SECTION 5: Manifesto Generation
# -----------------------------------

echo "=================================================="
echo "Generating your manifesto..."

# Pause execution for 1 second (for effect)
sleep 1


# -----------------------------------
# SECTION 6: Writing to File
# -----------------------------------

# Use redirection:
# >  → overwrite file
# >> → append to file

# Write heading (overwrite if file exists)
echo "                    ==== THE OPEN SOURCE MANIFESTO ====" > "$OUTPUT"

# Append date and author details
echo "Date: $DATE" >> "$OUTPUT"
echo "Author: $USER_NAME" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Write first paragraph (uses user inputs)
echo "I believe that software should be treated as a foundation for collective human progress, rather than a walled garden. Every single day, tools like $TOOL empower me to learn, create, and solve complex problems simply because their creators chose to share them with the world. To me, the core of open source is about $FREEDOM. It represents the inherent right to study, the freedom to tinker without boundaries, and the flexibility to adapt existing systems to fit our unique, evolving requirements." >> "$OUTPUT"

# Add spacing
echo "" >> "$OUTPUT"

# Write second paragraph (uses user inputs)
echo "Standing directly on the shoulders of giants, I recognize that my own technological journey is fueled entirely by community contributions. In the true spirit of the free software movement, if given the opportunity and resources, I would actively build a $BUILD and distribute it freely under an open-source license. By contributing back to the FOSS ecosystem, we collectively ensure that technology continues to serve everybody, governed by transparent collaboration rather than proprietary control." >> "$OUTPUT"


# -----------------------------------
# SECTION 7: Output Display
# -----------------------------------

# Notify user of success
echo "Success! Your manifesto has been saved to '$OUTPUT'."

echo "--------------------------------------------------"
echo "          Preview of your Manifesto:"
echo "--------------------------------------------------"

# Display contents of generated file
cat "$OUTPUT"

echo "=================================================="
