#build and merge
library(git2r)

tag_list <- Sys.getenv("tag_list")
this_is_the_directory_object <- Sys.getenv("dir_names")


if (dir.exists(paste0("public/materials/", this_is_the_directory_object)) == FALSE){
    dir.create(paste0("public/materials/", this_is_the_directory_object), recursive = T)
}


# Build all books in the books subdir

if (exists("this_is_the_directory_objec") == FALSE){
  print("NO DIRECTORY NAMES")
}

print(paste("Building book ", tag_list))

checkout(".", tag_list)

if (getwd() != "materials/reproducible-analysis-in-r"){
  setwd("materials/reproducible-analysis-in-r")
}

devtools::install_deps('.') # Installs book-specific R deps
# defined in DESCRIPTION file
bookdown::render_book('index.Rmd', c('bookdown::gitbook'))

fls <- list.files("_book")

dir_names <- Sys.getenv("dir_names")
this_path <- paste0("../../public/materials/", this_is_the_directory_object)

file.copy(paste0("_book/",fls), this_path, recursive = T, overwrite = T, copy.mode = T)

unlink("_book", recursive = T)

setwd("../..")



