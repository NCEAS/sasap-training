#build and merge
library(git2r)

top <- getwd()


#' Turn ordinary strings into valid "slugs" so we can use them in URLs
#' @param content (character) The string to slugify
slugify <- function(content) {
  gsub("[^a-z0-9]", "-", tolower(content))
}



#' First, we determine which tags are available to build and what their human-
#' readable names are. GitHub's tag naming feature is used to control the human-
#' readable name.
releases <- gh::gh("/repos/nceas/sasap-training/releases")
tag_list <- vapply(releases, "[[", "", "tag_name")
tag_names <- vapply(vapply(releases, "[[", "", "name"), slugify, "")

if (!dir.exists(file.path(top, "public", "materials"))) {
  dir.create(file.path(top, "public", "materials"), recursive = TRUE)
}

# Build all books in the books subdir
for (zz in 1:length(tag_list)) {

  print(paste("Building book ", tag_list[zz]))

  checkout(".", tag_list[zz])

  if (getwd() != "materials/reproducible-analysis-in-r"){
    setwd("materials/reproducible-analysis-in-r")
  }
  remotes::install_deps('.') # Installs book-specific R deps
  # defined in DESCRIPTION file
  bookdown::render_book('index.Rmd', c('bookdown::gitbook'), clean_envir = F)

  message("Copying _book folder from ", getwd(), " to ", file.path(top, "public", "materials", tag_names[zz]))
  copy_dest <- file.path(top, "public", "materials", tag_names[zz])
  system2("cp", c("-r", "_book", copy_dest))

  message("Materials folder contains:", dir(file.path(top, "public", "materials")))

  unlink("_book", recursive = T)

  setwd(top)
}
