#!/bin/bash

for year in $(seq 1960 2016); do
	num_dirty_words=0
	for word in $(cat facebook-bad-words-list-file_2021_01_18.txt); do
		year_songs=$(cat lyrics/"${year}"*|tr ' ' '\n'|tr -d '[:punct:]'|tr '[:lower:]' '[:upper:]'|grep -wc "${word}")
		num_dirty_words=$((num_dirty_words+year_songs))
	done
	echo "${year}", "${num_dirty_words}"
done
