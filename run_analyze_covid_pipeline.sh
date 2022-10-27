#!/bin/bash

# A bash script to drive the rendering of an Rmarkdown file using some
# parameters passed in from the shell
# this script expects one command line parameters
# the first should be a US state, and the second is the raw apple mobility
# data csv file downloaded from apple.com

# Nitish Bhargava
# October 24, 2022
# 2001nitish@gmail.com

if [ $# -lt 1 ]
then
  echo "To run this script, supply one argument:"
  echo "The name of the state to be analyzed."
  exit 1
fi

state=$1
state=${state// /_}

Rscript -e "rmarkdown::render('Analysis.Rmd',\
            params = list(state = '$1',\
            data = 'data/raw_data/applemobilitytrends-2022-04-12.csv'),\
            output_dir = 'output',\
            output_file = 'Analysis_$state')"
