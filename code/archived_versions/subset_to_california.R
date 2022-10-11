# This is a script to subset apple mobility data down to
# the state of California and then save that subset to a
# csv file in the output directory

# Nitish Bhargava
# August 31, 2022
# 2001nitish@gmail.com

# load in the full apple mobility dataset
full_dataset <- read.csv("data/raw_data/applemobilitytrends-2022-04-12.csv")

# subset data to just California
ca_dataset <- full_dataset[full_dataset$sub.region == "California", ]

# write out the subsetted data to a csv file in the output directory
write.csv(ca_dataset, "output/apple_mobility_ca_subset_2022-04-12.csv",
          row.names = FALSE)
