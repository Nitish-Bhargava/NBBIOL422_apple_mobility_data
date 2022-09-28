# Test Script for merging 01_subset_data and 02_summarize_counties_cites

# load library
library("dplyr")

# Source Functions
source("code/functions/subset_mobility_data.R")
source("code/functions/summarize_mobility_data.R")

# Enter list of states in c("state", ...)
list_of_states <- c("California","Utah","Ohio","New York","Alaska")

# Loop with both subsetting and summarizing
for (state_to_subset in list_of_states) {
  # Subsetting of data
  subset_mobility_data("data/raw_data/applemobilitytrends-2022-04-12.csv",
                       state_to_subset)
  # Summarizing of data
  summarize_mobility_data(state_to_subset)
}
