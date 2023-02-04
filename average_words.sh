#!/bin/bash

for year in $(seq 1960 2016) ; do 
	total_songs=$(ls -1 lyrics/"${year}"*|wc -l)
	total_words=$(cat lyrics/"${year}"*|tr ' ' '\n' |sort|uniq|wc -l)
	echo "${total_words}" / "${total_songs}" | bc -l
done > average_words_graph
