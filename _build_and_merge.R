# Build script for bookdown materials

# This script will build bookdown materials from the head of a training branch (branch_name).
# This is useful for when materials are in the process of being developed, to allow Travis
# to build, without relying on the user to check in a whole bunch of bookdown files
# for a simple change. After development is done (usually after the training ends) this
# script should be turned off by commenting out the line that runs it in travis.yml. The
# branch should be merged into master, and the built materials checked into public/materials
library(git2r)

top <- getwd()

file.create(".nojekyll")

# change this to reflect branch name, and give a tag name to append to URL
branch_name <- c("Fai_2018")
tag_names <- c("fairbanks")

url_base <- paste0("reproducible_research_in_r_", tag_names)


print(paste("Building book ", branch_name))

# checkout branch
system2("git", c("checkout", branch_name))

# make sure wd is where the bookdown materials are
if (getwd() != "materials/reproducible-analysis-in-r"){
  setwd("materials/reproducible-analysis-in-r")
}

remotes::install_deps('.') # Installs book-specific R deps defined in DESCRIPTION file
bookdown::render_book('index.Rmd', c('bookdown::gitbook'), clean_envir = F) # render book

message("Copying _book folder from ", getwd(), " to ", file.path(top, "public", "materials", url_base))

# copy book over to public/materials/
copy_dest <- file.path(top, "public", "materials", url_base)
system2("cp", c("-r", "_book", copy_dest))

message("Materials folder contains:", dir(file.path(top, "public", "materials")))

unlink("_book", recursive = T)

setwd(top)

