---
title: "Fairbanks, Oct 2018: Reproducible analysis with R"
---

[![sasap_banner](/images/banner_test.jpg)](https://alaskasalmonandpeople.org)

__Dates__: October 16-17, 2018<br>
__Location__: Fairbanks, AK<br>
__Venue__: UAF, International Arctic Research Center, room 417

This event will cover techniques for building reproducible analysis workflows using
the R programming language through a series of hands-on coding sessions.  We will
use examples from integrating salmon brood data across the state of Alaska to show 
how heterogeneous data can be cleaned, integrated, and documented through workflows
written in RMarkdown.  After an overview of the use of RMarkdown for literate
analysis, we will dive into critical topics in data science, including version 
control, data modeling, cleaning, and integration, and then data visualization
both for publications and the web.

## Prerequisites and Topics:

- __Prerequisite__: familiarity with R and statistical analysis
    For more detailed information on how to prepare for the workshop, see [Preparing for the Workshop]({{<ref "#preparing-for-the-workshop" >}})
- Open Science Tools to support synthesis of salmon data and management
- Effective data management for salmon data management, analysis, and synthesis
- Practical open science skills for salmon management

## Registration instructions

- [Register online](https://docs.google.com/forms/d/e/1FAIpQLSfk5fRIwuhsTPZZOjqZ2QQUKxO66oDXetqzoOlb0DXUTiJ-8g/viewform?usp=sf_link)
- Space is limited to 20-25 people, so higher priority to earlier registrants
- If interest exceeds capacity, we will create a waitlist

## Agenda

|                      |                               |
|:---------------------|:------------------------------|
|**Tuesday, Oct. 16**  |                               |
|8:30 - 9:30           |Introduction and Motivation    |
|9:30 - 10:00          |R, RStudio, git Setup          |
|10:00 - 10:30         |Break                          |
|10:30 - 11:30         |RMarkdown                      |
|11:30 - 12:30         |git/GitHub                     |
|12:30 - 1:30          |Lunch                          |
|1:30 - 2:30           |Data Modeling                  |
|2:30 - 3:30           |Tidyverse                      |
|3:30 - 4:00           |Break                          |
|4:00 - 5:00           |Tidyverse contd.               |
|**Wednesday, Oct. 17**|                               |
|8:30 - 10:00          |Hands-On Data Tidying          |
|10:00 - 10:30         |Break                          |
|10:30 - 12:00         |Data Visualization             |
|12:00 - 1:00          |Lunch                          |
|1:00 - 2:00           |Git: Collaboration and Conflict Management      |
|2:00 - 3:00           |Data Documentation/Publishing  |
|3:00 - 3:30           |Break                          |
|3:30 - 5:00           |Publishing Analysis to the Web |

## Preparing for the Workshop

### Required software

We will primarily be using a web browser, `R`, RStudio, and `git`. Please be sure these are all installed on your laptop, as follows:

- **R:** We will use R version 3.5.1, which you can download and install from [CRAN](https://cran.rstudio.com)

- **RStudio**: To download RStudio, visit [RStudio's download page](https://www.rstudio.com/products/rstudio/download/).
  *If you don't know how up to date your version of RStudio is, please download an updated copy and install it*
    
- **R packages:** Please be sure you have installed or updated the following packages:

    - datapack
    - devtools
    - dplyr
    - DT
    - ggplot2
    - ggpmisc
    - kableExtra
    - leaflet
    - readxl
    - tidyr
    - ggmap
    - sf
    - raster
    
    You can install these packages quickly by running the following code snippets:

    ```r

    packages <- c( "devtools", "dplyr", "DT", "ggplot2", "ggpmisc", 
                   "kableExtra", "leaflet", "readxl", "remotes", "tidyr",
                   "ggmap", "sf", "raster")
    ```
    
    ```r
    for (package in packages) { 
        if (!(package %in% installed.packages())) {install.packages(package)} 
        else if (package %in% old.packages()){install.packages(package)}
    }
    ```

- **git:** [Download git](https://git-scm.com/downloads) and install it on your system.
- **GitHub:** We will be using [GitHub](https://github.com) so you will need create (or remember your existing) GitHub login

### Refresh your skills

This workshop assumes a base level of experience using R for scientific and statistical analyses.
However, we realize that not everyone will be at the same place in terms of familiarity with the tools we'll be using.
If you'd like to brush up on your R skills prior to the workshop, check out this list of resources we like:

- The [Data Scientist with R](https://www.datacamp.com/tracks/data-scientist-with-r) track at [DataCamp](https://www.datacamp.com)
- The [Introduction to R](http://www.datacarpentry.org/R-ecology-lesson/01-intro-to-r.html) lesson in [Data Carpentry's R for data analysis](http://www.datacarpentry.org/R-ecology-lesson/) course.
- The QCBS [Introduction to R](https://qcbs.ca/wiki/r) lesson
- [RStudio's R Programming](https://www.rstudio.com/online-learning/) page

If you're a fan of cheat sheets, [RStudio](https://www.rstudio.com) provides some fantastic ones on their [Cheat Sheets](https://www.rstudio.com/resources/cheatsheets/) page.
*Please make sure to print ahead of time if you prefer hard copies.*
In particular, check out:

* Base R
* Data Import 
* Data Transformation with dplyr 
* R Markdown
* Data Visualization with ggplot2
* R Markdown Reference Guide 
* The leaflet package


## Organizers

|Name         | Email              |
|-------------|--------------------|
|Matthew Jones| jones@nceas.ucsb.edu |
|Jeanette Clark| jclark@nceas.ucsb.edu |
|Jorge Cornejo| cornejo@nceas.ucsb.edu |


## Acknowledgements

These training events were supported by:

The [Gordon and Betty Moore Foundation](https://www.moore.org), __Salmon Data Task Force__ award to M. B. Jones and I. Dutton.
<img src="/images/moore-logo-color.jpg" id="moorelogo"/>
<img src="/images/nceas.png" id="nceaslogo"/>

Additional support was provided for collaboration by the [National Center for Ecological Analysis and Synthesis](https://www.nceas.ucsb.edu), a Center funded by the University of California, Santa Barbara, and the State of California.

