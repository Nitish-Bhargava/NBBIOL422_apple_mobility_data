# make data longer

# Nitish Bhargava
# September 27, 2022
# 2001nitish@gmail.com

# load library
library("tidyr")
library("readr")

make_data_long <- function(subsetted, state_to_subset) {

  # Use tidyr pivot_longer function to make file longer
  file_to_make_longer2 <- tidyr::pivot_longer(
    subsetted, cols = starts_with("20"), names_to = "date")

  # Defensive code to prevent 0 row files
  if (nrow(file_to_make_longer2) == 0) {
    stop("There is no state by that name. Did you make a typo")
  }

  # Get rid of spaces
  state_no_spaces <- gsub(state_to_subset, pattern = " ", replacement = "_")

  # Write csv
  readr::write_csv(file_to_make_longer2, paste0("output/",
                                                state_no_spaces,
                                                "_subset_long_form_data",
                                                "_applemobilitytrends-",
                                                "2022-04-12.csv"))
}
