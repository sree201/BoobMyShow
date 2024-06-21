#!/bin/bash
## Q) Write a script that reads a text file and counts the occurrences of each word, displaying the top 5 most frequent words along with their counts.

# File to read
file_name="your_file.txt"

# Check if the file exists
if [ ! -f "$file_name" ]; then
    echo "File '$file_name' not found."
    exit 1
fi

# Read the file, normalize text to lowercase, remove punctuation, and count occurrences
word_count=$(tr -s '[:space:]' '\n' < "$file_name" | tr -d '[:punct:]' | tr '[:upper:]' '[:lower:]' | grep -v '^$' | sort | uniq -c | sort -nr)


# tr -s '[:space:]' '\n' < "$file_name":
# This part of the command performs text transformation using the tr command.
# -s: This option stands for ‘squeeze-repeats’. It replaces each sequence of a repeated character that is listed in the set of characters to be replaced (in this case, whitespace characters) with a single occurrence of that character.
# It replaces consecutive spaces (or any whitespace characters) with newline characters (\n) in the content of the file specified by the variable $file_name.
# The result is a stream of words separated by newlines.
# '[:space:]': This represents all whitespace characters (including space, tab, newline, etc.). So, -s '[:space:]' squeezes each sequence of whitespace characters in the input into a single space.
# '\n': This tells tr to replace the whitespace characters with a newline character.
# < "$file_name": This part is a redirection that tells the shell to read input from the file named file_name instead of from the standard input.
# The purpose of this line is to count the number of words in a file. It does so by replacing all sequences of whitespace with a single newline character, effectively putting each word on a new line. Then, it can count the number of lines to get the word count. The  result is stored in the variable word_count.

# tr -d '[:punct:]':
# This part removes all punctuation characters from the stream of words obtained in the previous step.
# Punctuation characters include symbols like periods, commas, exclamation marks, etc.
# tr '[:upper:]' '[:lower:]':
# This part converts all uppercase letters to lowercase.
# It ensures that the word count is case-insensitive.

# grep -v '^$':
# This part filters out empty lines (lines with no content) from the stream of words.
# The -v option in grep means “invert match,” so it selects lines that do not match the specified pattern (^$ represents an empty line). (It will print all lines from input)

# sort:
# This sorts the words alphabetically.
# It prepares the data for the next step.

# uniq -c: Removes duplicate lines and prefixes each line with the count of occurrences.
# The -c option shows the count next to each word.

# sort -nr:
# This sorts the word count results in descending order (from highest count to lowest count).
# The -n option ensures numeric sorting, and -r reverses the order

# head -n 5: Displays the top 5 lines of the output.

# awk '{print $2, $1}': AWK to print the second and first columns (word and count, respectively).

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