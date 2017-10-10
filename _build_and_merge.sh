#!/bin/sh

set -e

export TOP=$(pwd)

echo "Building books..."

if [ ! -d public/books ]; then
    mkdir -p public/books
fi

# Build all books in the books subdir
for book in $(ls books)
do
    echo "Building book in '$book'"
    cd "books/$book"
    Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
    cp -r _book "$TOP/public/books/$book"
    cd "$TOP"
done
