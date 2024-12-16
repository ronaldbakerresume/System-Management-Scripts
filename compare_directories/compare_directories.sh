#!/bin/bash
# Compare two directories and list differences

DIR1=${1?"Usage: $0 <directory1> <directory2>"}
DIR2=${2?"Usage: $0 <directory1> <directory2>"}

echo "Comparing directories: $DIR1 and $DIR2"

# Find files in both directories and compare
diff -rq "$DIR1" "$DIR2" | tee directory_comparison.txt

echo "Comparison complete. Results saved in directory_comparison.txt"

