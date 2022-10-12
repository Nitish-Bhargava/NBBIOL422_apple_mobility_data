# This project is to adapt the Apple mobility data to create .csv file for any state

The data is available from the following URL: <https://covid19.apple.com/mobility>

It was downloaded on April 12, 2022 for analysis.

To use put state name in file 01_subset_data.R
Replace list of states with desired states in the same format as the five states listed currently
csv file with data should appear in output

Next to summarize the csv files using dplyr
Replace list of states in file 02_summarize_counties_cities.R with desired lists
csv files with data should appear in output

## Notes

* Sept. 13 2022- code file was adapted for all states
* Sept. 14 2022- defensive code was added to account for spelling errors or missing states
* Sept. 22 2022- added 02_summarize_counties_cities.R that summarizes csv from 01_subset_data.R
* Oct. 07 2022- edited function files to use dplyr and readr to correctly use data. Add Rmd to drive entire analysis
