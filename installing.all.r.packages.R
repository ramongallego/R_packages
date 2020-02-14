all.packags <- readRDS("all.R.packages.installed.rds")

str(all.packags)

install.packages(all.packags)

tibble(libs = installed.packages()[,1]) -> all.in.new.installation

library(tidyverse)
tibble::tibble(all.libs = all.packags[,1]) %>%
  filter (!all.libs %in% all.in.new.installation$libs )
