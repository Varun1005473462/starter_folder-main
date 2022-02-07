#### Preamble ####
# Purpose: Download data from opendatatoronto
# Author: Varun Vijay
# Data: 31 January 2021
# Contact: varun.vijay@mail.utoronto.ca
# License: MIT



#### Workspace setup ####
# Use R Projects, not setwd().
library(opendatatoronto)
library(tidyverse)
library(dplyr)
library(knitr)


## data download from https://open.toronto.ca/dataset/police-annual-statistical-report-shooting-occurrences/


# Datasets are grouped into packages that have multiple datasets
## relevant to that topic. So we first look at the package
## using a unique key that we obtain from dataset webpage
# get package
package <- show_package("f29feb49-ceb1-44bf-a2b6-5fc6a0e6147a")
package

# get all resources for this package
resources <- list_package_resources("f29feb49-ceb1-44bf-a2b6-5fc6a0e6147a")


# We need the unique key from that list of resources


shooting_occurences <- resources %>% get_resource()
shooting_occurences

### Saving data ###
write_csv(shooting_occurences,'inputs/data/shooting_occurrences.csv')



