#!/bin/bash

TARGET="$1"  # First argument passed to the script
OUTPUT="$HOME/Downloads/scan_result_$TARGET.txt"

# Check if an IP or hostname was provided
if [ -z "$TARGET" ]; then
    notify-send "🚫 Scan Failed" "No target IP or hostname provided!"
    exit 1
fi

nmap -sV -sC -oN "$OUTPUT" "$TARGET"
notify-send "✅ Nmap Scan Finished" "Results saved to $OUTPUT"

