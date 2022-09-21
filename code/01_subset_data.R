# This is a script to subset apple mobility data down to
# a state and then save that subset to a
# csv file in the output directory

# Nitish Bhargava
# September 13, 2022
# 2001nitish@gmail.com

# load our functions
source("code/functions/subset_mobility_data.R")

# use the subset_mobility_data function to subset out just state rows
subset_mobility_data(input_data_file =
                       "data/raw_data/applemobilitytrends-2022-04-12.csv",
                     state_to_subset = "ENTER_STATE_HERE")
