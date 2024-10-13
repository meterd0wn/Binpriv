#!/bin/bash

# Author: Daniel Paul (aka @meterd0wn)

# Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

# Function to display help message
show_help() {
    echo "Binaries Priv esc testcases for OSCP."
    echo "Usage: $0 -s <file_path> -x <search_string>"
    echo ""
    echo "Options:"
    echo "  -s <file_path>     Specify the file path with binary paths"
    echo "  -x <search_string> Specify the string to add in searchsploit searching. Ex: -x priv, -x \"priv esc\""
    echo "  -h                 Display this help message."
    exit 0
}

# Parse command-line options
while getopts ":s:x:h" opt; do
    case $opt in
        s) 
            file_path="$OPTARG"
            ;;
        x) 
            search_string="$OPTARG"
            ;;
        h) 
            show_help
            ;;
        \?) 
            echo "Invalid option: -$OPTARG" >&2
            show_help
            ;;
        :) 
            echo "Option -$OPTARG requires an argument." >&2
            show_help
            ;;
    esac
done

# Check if no arguments are provided
if [ $# -eq 0 ]; then
    show_help
fi

# Check if the file exists
if [ ! -f "$file_path" ]; then
    echo "Error: File '$file_path' not found."
    exit 1
fi

# Command for running Searchbins
searchbins -s $file_path

# Extract binary names from each path and store them in a variable
binary_names=$(awk -F'/' '{print $NF}' "$file_path" | sort -u)

# Commands for running Searchsploit
echo -e "\n${blueColour}[*] Listing number of found exploits+shellcodes using searchsploit...${endColour}"

for bin in $binary_names; do
    searchsploit $bin $search_string -w -j | jq -r --arg bin "$bin" 'if (.RESULTS_EXPLOIT | length) > 0 or (.RESULTS_SHELLCODE | length) > 0 then "\u001b[33m\($bin)\u001b[0m: \u001b[32m \((.RESULTS_EXPLOIT | length) + (.RESULTS_SHELLCODE | length))\u001b[0m" else empty end'
done

