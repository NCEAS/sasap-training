#build and merge
library(git2r)

tag_list <- Sys.getenv("tag_list")
dir_names <- Sys.getenv("dir_names")


if (dir.exists(paste0("public/materials/", dir_names)) == FALSE){
    dir.create(paste0("public/materials/", dir_names), recursive = T)
}


# Build all books in the books subdir


  print(paste("Building book ", tag_list))

  checkout(".", tag_list)

    if (getwd() != "materials/reproducible-analysis-in-r"){
      setwd("materials/reproducible-analysis-in-r")
    }

  devtools::install_deps('.') # Installs book-specific R deps
  # defined in DESCRIPTION file
  bookdown::render_book('index.Rmd', c('bookdown::gitbook'))

  fls <- list.files("_book")

  file.copy(paste0("_book/",fls), paste0("../../public/materials/", dir_names), recursive = T, overwrite = T, copy.mode = T)

  unlink("_book", recursive = T)

  setwd("../..");


