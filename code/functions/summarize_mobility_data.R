# A Script file to summarize a state's worth of
# apple mobility data using the dplyr package

# Nitish Bhargava
# September 22, 2022
# 2001nitish@gmail.com

# load packages
library("dplyr")

# function to summarize data from csv files
summarize_mobility_data <- function(state_no_spaces) {

  # load in file
  state_data <- readr::read_csv(paste0("output/",
                                       state_no_spaces
                                       , "_subset_data_",
                                       "applemobilitytrends-2022-04-12.csv"))

  # tally the count of cities and counties in the state with mobility data
  # we'll use dplyr functions and pipes to do this
  summarized_cities_counties <- state_data %>%
    select(geo_type, region, transportation_type) %>%
    group_by(geo_type, transportation_type) %>%
    tally()

  # defensive code
  if (nrow(summarized_cities_counties) == 0) {
    stop("There is no file with that name. Did you make a typo?")
  }

  # Write out the summarized table to a csv in the output directory
  readr::write_csv(summarized_cities_counties,
                   paste0("output/summarized_",
                          state_no_spaces,
                          "_mobility_data_2022-04-12.csv"))
  # Return code
  return(summarized_cities_counties)
}
