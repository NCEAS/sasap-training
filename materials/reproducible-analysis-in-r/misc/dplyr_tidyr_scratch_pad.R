library(dplyr)
library(knitr)
library(tidyr)

dat <- data.frame(year = c(1990, 1990, 1991, 1992, 1993, 1993),
                  species = "chinook",
                  length_cm = round(runif(6, 100, 150)))


library(tidyr)

dat <- data.frame(site = c("gold", "lake", "dredge"),
                  "1990" = round(runif(3, 100, 150)),
                  "1991" = round(runif(3, 100, 150)),
                  "1992" = round(runif(3, 100, 150)),
                  "1993" = round(runif(3, 100, 150)))
kable(dat)
