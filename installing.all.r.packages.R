# Load the list of all packages I have installed in my previous R version

all.packags <- readRDS("all.R.packages.installed.rds")

str(all.packags)

# Round 1: install from CRAN 
install.packages(all.packags)

# This should have done most of the job

library(tidyverse)
# Check what we have succeeded on
tibble(libs = installed.packages()[,1]) -> all.in.new.installation

# Round 2: Bioconductor packages

tibble::tibble(all.libs = all.packags[,1]) %>%
  filter (!all.libs %in% all.in.new.installation$libs ) %>% 
  pull %>% 
  map(BiocManager::install)

# Round 3 : Github repos - 

devtools::install_github("fishsciences/artemis", build_vignettes = TRUE)

devtools::install_github("jiho/castr")

devtools::install_github("bryandmartin/corncob")

devtools::install_github("adw96/breakaway")
devtools::install_github("adw96/DivNet")

install.packages("rnaturalearthhires", repos = "http://packages.ropensci.org", type = "source")

devtools::install_github("ropenscilabs/roomba")

