#!/bin/bash

# parsing SARS-Cov-2 sequencing data
# Nitish Bhargava
# October 29, 2022
# 2001nitish@gmail.com

if [ $# -eq "0" ]
then
        echo "To run this script, supply two arguments"
        echo "The file to be analyzed and the 'ALL' to detailed output."
        exit 1
fi

# count up the number of sequences in a fasta file
if [ "$2" = 'ALL' ]
then    echo "number of sequences in the file is:"
        bioawk -c fastx '{print ">" $name $comment}' "$1" | wc -l
fi

# Tally up numer of SARS-CoV-2 sequences in dataset from each country and sort output
# from largest to smallest
zgrep "isolate.*Homo" "$1" | cut -d "|" -f21 | sort | uniq -c | sort -rn >> sort_countries.txt

