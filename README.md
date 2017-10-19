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

### Oustanding Issues

- Books don't link back to main site
- Header in nav bar isn't quite in vertical alignment with the nav links
- Site isn't fully responsive but it works well enough
- Consider putting the configuration of Bookdown books into the root `config.toml`

### How this works

Not everything is integrated nicely together so there are some folder organization conventions that need to be maintained for things to work.
Changes to these conventions will require updating multiple pieces.

- The root of the repository is a pretty standard [Blogdown](https://github.com/rstudio/blogdown) (See: Hugo) site.
- It's served using GitHub Pages but Travis CI does the task of pushing the prepared site content from the `master` to `gh-pages` branch.
- A root-level `DESCRIPTION` file is present to trick Travis CI into running
- [Bookdown](https://bookdown.org) books are stored in `/books` as subfolders within
- The books are built on Travis CI and moved into the site's `public` directory by Travis CI running `./build_and_merge.sh` during the job.

### Adding a new Workshop

Add a new subfolder into `./content/trainings/{your-training-name}`, replacing `{your-training-name}` with a short title for the training and place an `index.md` in that folder with the content that should appear.

### Adding a new Book (Material)

- Add a new Bookdown book into `./books/`.
- Manually add a link to `./content/materials.md`
