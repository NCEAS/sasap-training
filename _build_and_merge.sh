#!/bin/sh

set -e

export TOP
TOP=$(pwd)

echo "Building books..."

if [ ! -d public/materials ]; then
    mkdir -p public/materials
fi

# Build all books in the books subdir
for book in $(ls materials)
do
    echo "Building book in '$book'"
    cd "materials/$book"
    Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
    cp -r _book "$TOP/public/materials/$book"
    cd "$TOP"
done
