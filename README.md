[![sasap_logo](https://alaskasalmonandpeople.org/wp-content/uploads/2016/06/banner_test.jpg)](https://alaskasalmonandpeople.org)
<br>

# Open science for salmon

## Practical open science approaches to salmon data management, analysis, and synthesis

- November 28-29, 2017
- Juneau, AK

- Open Science Tools to support synthesis of salmon data and management
- Effective data management for salmon data management, analysis, and synthesis
- Practical open science skills for salmon management

- Series of open science training workshops targeting:
  - [First workshop](https://nceas.github.io/sasap-training/): Biostatisticians and modelers (this workshop, Juneau)
  - Second workshop: Field biologists (Anchorage)
  - Third workshop: TBD

### Acknowledgements

Work on this package was supported by:

The Gordon and Betty Moore Foundation, __Salmon Data Task Force__ award to M. B. Jones and I. Dutton.

[<img src="static/images/moore-logo-color.jpg" width="200px" />](https://www.moore.org)

Additional support was provided for collaboration by the [National Center for Ecological Analysis and Synthesis](https://www.nceas.ucsb.edu), a Center funded by the University of California, Santa Barbara, and the State of California.

[![nceas_footer](static/images/nceas.png)](http://www.nceas.ucsb.edu)

## About this repository

This repository is an integration of [Blogdown](https://github.com/rstudio/blogdown) and [Bookdown](https://bookdown.org).
Some amount of wrangling was required to get all of this set up and not everything may be obvious to all viewers.

### How this works

Not everything is integrated nicely together so there are some folder organization conventions that need to be maintained for things to work.
Changes to these conventions will require updating multiple pieces and will be error-prone.

- The root of the repository is a pretty standard [Blogdown](https://github.com/rstudio/blogdown) (See: Hugo) site.
- It's served using GitHub Pages but Travis CI does the task of pushing the prepared site content from the `master` to `gh-pages` branch.

    The reasonfor this is because each course's material are a Bookdown book and Blogdown doesn't know how to render Bookdown books *and* we wanted Travis CI to build everything so we could ensure our own work was reproducible
- A root-level `DESCRIPTION` file is present to trick Travis CI into running
- [Bookdown](https://bookdown.org) books are stored in `/materials` as subfolders within
- The books are built on Travis CI and moved into the site's `public` directory by Travis CI running `./build_and_merge.sh` during the job.

### Adding a new Event

Add a new subfolder at `./content/events/{your-training-name}`, replacing `{your-training-name}` with a short title for the training and write up an `index.md` in that folder with your content. I'd suggest just copying an existing event and modifying it for your needs.

### Adding a new Book (Material)

- Add a new Bookdown book into `./materials/`. I'd suggest copying an existing book and modifying it to your needs.
    Make sure the DESCRIPTION file in the root of your book (not the root of this repo) contains the necessary `Imports` to load all of the packages required by your book. Travis CI installs each book's dependencies just prior to building the book by running `devtools::install_deps('.')` in the book's top level directory.
- Manually add a link in `./content/materials.md`
