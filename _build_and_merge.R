#build and merge
library(git2r)


build_path <- Sys.getenv("build_path")
print(build_path)

tag_list <- names(tags())
these_are_dir_names <- c("reproducible-research-in-r-juneau", "reproducible-research-in-r-anchorage")

for (n in these_are_dir_names){
  if (dir.exists(paste0("public/materials/", n)) == FALSE){
    dir.create(paste0("public/materials/", n), recursive = T)
  }
}


# Build all books in the books subdir
for (zz in 1:2) {

  setwd(build_path)

  if (getwd() != "materials/reproducible-analysis-in-r"){
    setwd("materials/reproducible-analysis-in-r")
  }

  tag_list <- names(tags())

  print(paste("Building book ", tag_list[zz]))
  checkout(".", tag_list[zz])

  if (getwd() != "materials/reproducible-analysis-in-r"){
    setwd("materials/reproducible-analysis-in-r")
  }
  devtools::install_deps('.') # Installs book-specific R deps
  # defined in DESCRIPTION file
  bookdown::render_book('index.Rmd', c('bookdown::gitbook'), clean_envir = F)

  fls <- list.files("_book")

  these_are_dir_names <- c("reproducible-research-in-r-juneau", "reproducible-research-in-r-anchorage")

  file.copy(paste0("_book/",fls), paste0("../../public/materials/", these_are_dir_names[zz]), recursive = T, overwrite = T, copy.mode = T)

  unlink("_book", recursive = T)

  setwd("../..")
}

print(warnings())
