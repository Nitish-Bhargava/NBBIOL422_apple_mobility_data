#!/bin/ban

# A bash script to drive the rendering of an Rmarkdown file using some
# parameters passed in from the shell

Rscript -e "rmarkdown::render('Analysis.Rmd',\
            params = list(state = 'Ohio',\
            data = 'data/raw_data/applemobilitytrends-2022-04-12.csv))"
