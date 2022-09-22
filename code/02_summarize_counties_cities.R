# A Script file to summarize a state's worth of
# apple mobility data using the dplyr package

# Nitish Bhargava
# September 21, 2022
# 2001nitish@gmail.com

# load packages
library("dplyr")

# read in subsettted state csv
input_file_name <- "output/apple_mobility_ca_subset_2022-04-12.csv"
state_data <- read.csv(input_file_name)

# tally the count of cities and counties in the state with mobility data
# we'll use dplyr functions and pipes to do this
summarized_cities_counties <- state_data %>%
  select(geo_type, region, transportation_type) %>%
  group_by(geo_type, transportation_type) %>%
  tally()

# Write out the summarized table to a csv in the output directory
write.csv(summarized_cities_counties,
          paste0("output/summarized_",
                 state_to_subset,
          "_mobility_data_2022-04-12.csv"))

# Filter for specific types of data
state_data %>%
  filter(transportation_type == "driving") %>%
  select(geo_type, region, transportation_type) %>%
  group_by(geo_type, transportation_type) %>%
  tally()
