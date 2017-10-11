#!/bin/sh

set -e

export TOP
TOP=$(pwd)

echo "Building materials..."

if [ ! -d public/materials ]; then
    mkdir -p public/materials
fi

# Build all materials in the materials subdir
for book in ./materials/*
do
    echo "Building Bookdown book in directory '$book'"
    cd "materials/$book"
    Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
    cp -r _book "$TOP/public/materials/$book"
    cd "$TOP"
done
