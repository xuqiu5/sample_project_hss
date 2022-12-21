#!/bin/bash

# receive directory from user input
dir=$1

cd "$dir"

# create output directory, remove previous results, if existing
rm -rf ./output
mkdir  output

# loop through file and fun R script

for FILE in *; do
	echo $FILE;
	# passing to R
	Rscript ../plot.R $FILE --save
done

