library(readr)
library(dplyr)
library(tidyr)

catches <- read_csv("~/Downloads/df35b.302.1.csv")
names(catches) <- tolower(names(catches))
catches <- catches %>% select(-all, -notesregcode)
catches <- catches %>% gather(species, catch, -region, -year)
write_csv(catches, "misc/byerly_et_al_catch.csv")
