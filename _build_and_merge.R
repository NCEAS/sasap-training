#build and merge
library(git2r)

top <- getwd()

file.create(".nojekyll")

#' First, we determine which tags are available to build and what their human-
#' readable names are. GitHub's tag naming feature is used to control the human-
#' readable name.
tag_list <- c("Jnu_2017", "Anc_2018", "Fai_2018")
tag_names <- c("juneau", "anchorage", "fairbanks")

url_base <- paste0("reproducible_research_in_r_", tag_names)

if (!dir.exists(file.path(top, "public", "materials"))) {
  dir.create(file.path(top, "public", "materials"), recursive = TRUE)
}

# Build all books in the books subdir
for (zz in 1:length(tag_list)) {

  print(paste("Building book ", tag_list[zz]))

  #checkout(".", tag_list[zz])
  system2("git", c("checkout", tag_list[zz]))

  if (getwd() != "materials/reproducible-analysis-in-r"){
    setwd("materials/reproducible-analysis-in-r")
  }
  remotes::install_deps('.') # Installs book-specific R deps
  # defined in DESCRIPTION file
  bookdown::render_book('index.Rmd', c('bookdown::gitbook'), clean_envir = F)

  message("Copying _book folder from ", getwd(), " to ", file.path(top, "public", "materials", url_base[zz]))
  copy_dest <- file.path(top, "public", "materials", url_base[zz])
  system2("cp", c("-r", "_book", copy_dest))

  message("Materials folder contains:", dir(file.path(top, "public", "materials")))

  unlink("_book", recursive = T)

  setwd(top)
}
