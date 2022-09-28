# A Script file to summarize a state's worth of
# apple mobility data using the dplyr package

# Nitish Bhargava
# September 21, 2022
# 2001nitish@gmail.com

# load packages
library("dplyr")

# Source function
source("code/functions/summarize_mobility_data.R")

# for loop that allows for multiple files to be used
for (state_to_subset in c("California", "Utah", "Ohio", "New York", "Alaska")) {
  summarize_mobility_data(state_to_subset)
}

