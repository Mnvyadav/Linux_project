#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Ankshit | Course: Open Source Software

echo "=================================================="
echo "     The Open Source Manifesto Generator"
echo "=================================================="
echo "Answer three questions to generate your personalized manifesto."
echo ""

read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

DATE=$(date '+%d %B %Y')
USER_NAME=$(whoami)
OUTPUT="manifesto_${USER_NAME}.txt"

# Alias concept demonstrated via a comment
# alias read_manifesto="cat $OUTPUT"

echo "=================================================="
echo "Generating your manifesto..."
sleep 1

# Compose paragraph using variables, utilizing redirection
echo "                    ==== THE OPEN SOURCE MANIFESTO ====" > "$OUTPUT"
echo "Date: $DATE" >> "$OUTPUT"
echo "Author: $USER_NAME" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "I believe that software should be treated as a foundation for collective human progress, rather than a walled garden. Every single day, tools like $TOOL empower me to learn, create, and solve complex problems simply because their creators chose to share them with the world. To me, the core of open source is about $FREEDOM. It represents the inherent right to study, the freedom to tinker without boundaries, and the flexibility to adapt existing systems to fit our unique, evolving requirements." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Standing directly on the shoulders of giants, I recognize that my own technological journey is fueled entirely by community contributions. In the true spirit of the free software movement, if given the opportunity and resources, I would actively build a $BUILD and distribute it freely under an open-source license. By contributing back to the FOSS ecosystem, we collectively ensure that technology continues to serve everybody, governed by transparent collaboration rather than proprietary control." >> "$OUTPUT"

echo "Success! Your manifesto has been saved to '$OUTPUT'."
echo "--------------------------------------------------"
echo "          Preview of your Manifesto:"
echo "--------------------------------------------------"
cat "$OUTPUT"
echo "=================================================="
