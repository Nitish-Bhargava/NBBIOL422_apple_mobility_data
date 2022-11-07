#!/bin/bash

set -euo pipefail

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
  echo "To run this script, supply three arguments:"
  echo "The name of the state to be analyzed and data file path."
  echo "
  exit 1
fi

state=$1
state=${state// /_}

RMD_PARAMS="params = list(statte = '$1', data = '$2', seqdata = '$3')"
RMD_OUTPUT="output_dir = 'output', output_file = 'Analysis_$state'"

Rscript -e "rmarkdown::render('Analysis.Rmd', $RMD_PARAMS, $RMD_OUTPUT)"
