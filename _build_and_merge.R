#build and merge
library(git2r)

tag_list <<- names(tags())
dir_names <<- c("reproducible-research-in-r-juneau", "reproducible-research-in-r-anchorage")

for (n in dir_names){
  if (dir.exists(paste0("public/materials/", n)) == FALSE){
    dir.create(paste0("public/materials/", n), recursive = T)
  }
}


# Build all books in the books subdir
for (zz in 1:length(tag_list)) {

  dir_names <- c("reproducible-research-in-r-juneau", "reproducible-research-in-r-anchorage")

  print(paste("Building book ", tag_list[zz]))
  checkout(".", tag_list[zz])
  if (getwd() != "materials/reproducible-analysis-in-r"){
    setwd("materials/reproducible-analysis-in-r")
  }
  devtools::install_deps('.') # Installs book-specific R deps
  # defined in DESCRIPTION file
  bookdown::render_book('index.Rmd', c('bookdown::gitbook'))



  fls <- list.files("_book")

  file.copy(paste0("_book/",fls), paste0("../../public/materials/", dir_names[zz]), recursive = T, overwrite = T, copy.mode = T)

  unlink("_book", recursive = T)

  setwd("../..");
}

