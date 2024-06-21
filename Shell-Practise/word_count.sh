#!/bin/bash

# File to read
file_name="your_file.txt"

# Check if the file exists
if [ ! -f "$file_name" ]; then
    echo "File '$file_name' not found."
    exit 1
fi

# Read the file, normalize text to lowercase, remove punctuation, and count occurrences
word_count=$(tr -s '[:space:]' '\n' < "$file_name" | tr -d '[:punct:]' | tr '[:upper:]' '[:lower:]' | grep -v '^$' | sort | uniq -c | sort -nr)

# Display the top 5 most frequent words
echo "Top 5 Most Frequent Words:"
echo "$word_count" | head -n 5 | awk '{print $2 " - " $1 " occurrences"}'



# #!/bin/bash

# # Check if a file path is provided
# if [ "$#" -ne 1 ]; then
#     echo "Usage: $0 path_to_text_file"
#     exit 1
# fi

# # Read the file and count word occurrences
# declare -A word_freq

# while read -r line; do
#     # Convert to lowercase and split the line into words
#     for word in $line; do
#         word=$(echo "$word" | tr '[:upper:]' '[:lower:]' | sed "s/[^a-zA-Z0-9']//g")
#         # Increment the word's count
#         ((word_freq["$word"]++))
#     done
# done < "$1"

# # Sort the word frequency list by count and get the top 5
# for word in "${!word_freq[@]}"; do
#     echo "$word ${word_freq[$word]}"
# done | sort -rn -k2 | head -n 5