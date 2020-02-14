all.packags <- readRDS("all.R.packages.installed.rds")

str(all.packags)

install.packages(all.packags)

library(tidyverse)
tibble(libs = installed.packages()[,1]) -> all.in.new.installation


tibble::tibble(all.libs = all.packags[,1]) %>%
  filter (!all.libs %in% all.in.new.installation$libs ) %>% 
  pull %>% 
  map(install.packages)

tibble::tibble(all.libs = all.packags[,1]) %>%
  filter (!all.libs %in% all.in.new.installation$libs ) %>% 
  pull %>% 
  map(BiocManager::install)

devtools::install_github("fishsciences/artemis", build_vignettes = TRUE)

devtools::install_github("jiho/castr")

devtools::install_github("bryandmartin/corncob")

devtools::install_github("adw96/breakaway")
devtools::install_github("adw96/DivNet")

install.packages("rnaturalearthhires", repos = "http://packages.ropensci.org", type = "source")

devtools::install_github("ropenscilabs/roomba")

