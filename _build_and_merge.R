#build and merge
library(git2r)

tag_list <- names(tags())
dir_names <- c("reproducible-research-in-r-juneau", "reproducible-research-in-r-anchorage")

if (dir.exists("public/materials") == FALSE){
  dir.create("public/materials", recursive = T)
}

# Build all books in the books subdir
for (i in 1:length(tag_list)) {

  print(paste("Building book ", tag_list[i]))
  checkout(".", tag_list[i])
  setwd("materials/reproducible-analysis-in-r")
  devtools::install_deps('.') # Installs book-specific R deps
  # defined in DESCRIPTION file
  bookdown::render_book('index.Rmd', c('bookdown::gitbook'))
  #Rscript -e "bookdown::render_book('index.Rmd', c('bookdown::gitbook', 'bookdown::pdf_book', 'bookdown::epub_book'))"
  file.copy("_book", file.path("/public/materials/", dir_names[i]), recursive = T)
  file.remove("_book", recursive = T)
  unlink("_book", recursive = T)
}


