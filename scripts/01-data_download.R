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
library(janitor)
library(tidyr)
library(reprex)


## data download from https://open.toronto.ca/dataset/covid-19-cases-in-toronto/


# Datasets are grouped into packages that have multiple datasets
## relevant to that topic. So we first look at the package
## using a unique key that we obtain from dataset webpage
# get package
package <- show_package("64b54586-6180-4485-83eb-81e8fae3b8fe")
package

# get all resources for this package
resources <- list_package_resources("64b54586-6180-4485-83eb-81e8fae3b8fe")


# We need the unique key from that list of resources


covid_cases <- resources %>% get_resource()
covid_cases

### Saving data ###
write_csv(covid_cases,'inputs/data/covid_cases.csv')



