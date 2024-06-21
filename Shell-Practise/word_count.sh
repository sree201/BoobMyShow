#!/bin/bash
## Write a script that reads a text file and counts the occurrences of each word, displaying the top 5 most frequent words along with their counts.

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


# Use tr to convert all spaces and punctuation to newlines,
# then use tr to convert everything to lowercase,
# sort the words, count the occurrences, and finally, display the top 5
# cat "$filename" | tr -s '[:space:][:punct:]' '\n' | tr '[:upper:]' '[:lower:]' | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2, $1}' 
# Logic ::

# cat "$filename": Outputs the content of the file specified by the variable $filename.

# tr -s '[:space:][:punct:]' '\n': Translates sequences of whitespace and punctuation characters into newline characters.

# tr '[:upper:]' '[:lower:]': Translates uppercase letters to lowercase.

# sort: Sorts the lines of text.

# uniq -c: Removes duplicate lines and prefixes each line with the count of occurrences.

# sort -nr: Sorts the output in descending order based on the count.

# head -n 5: Displays the top 5 lines of the output.

# awk '{print $2, $1}': AWK to print the second and first columns (word and count, respectively).

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