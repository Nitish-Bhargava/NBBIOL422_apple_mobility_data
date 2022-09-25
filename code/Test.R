# Test Script for merging 01_subset_data and 02_summarize_counties_cites

# load library
library("dplyr")

# Source Functions
source("code/functions/subset_mobility_data.R")
source("code/functions/summarize_mobility_data.R")

# Loop with both subsetting and summarizing
for (state_to_subset in c("California","Utah","Ohio","New York","Alaska")) {
  # Print of which state is being subsetted and summarized
  print(paste("The csv for", state_to_subset,
              "is being subsetted and summarized"))
  # Subsetting of data
  subset_mobility_data(input_data_file =
                         "data/raw_data/applemobilitytrends-2022-04-12.csv",
                       state_to_subset)
  # Summarizing of data
  summarize_mobility_data(state_to_subset)
}
