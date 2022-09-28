# This is a script to subset apple mobility data down to
# any state and then save that subset to a
# csv file in the output directory

# Nitish Bhargava
# September 13, 2022
# 2001nitish@gmail.com

subset_mobility_data <- function(input_data_file, state_to_subset) {

  # load in the full apple mobility dataset
  full_dataset <- readr::read_csv(input_data_file)

  # subset data to a selected state
  state_dataset <- full_dataset %>%
    dplyr::filter(`sub-region` == state_to_subset)

  # Get rid of spaces
  state_no_spaces <- gsub(state_to_subset, pattern = " ", replacement = "_")

  # add some defensive code to stop the function if the
  # subsetted dataset has 0 rows
  if (nrow(state_dataset) == 0) {
    stop("There is no state by that name. Did you make a typo")
    }

  # write out the subsetted data to a csv file in the output directory
  readr::write_csv(x = state_dataset,
                   file = paste0("output/",
                                 state_no_spaces,
                                 "_subset_",
                                 basename(input_data_file)))
}
