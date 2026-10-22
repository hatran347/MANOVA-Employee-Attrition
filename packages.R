options(repos = c(CRAN = "https://cloud.r-project.org"))
packages <- c("here", "readxl", "dplyr", "tidyr", "ggplot2", "car", "biotools", "rstatix", "vegan",
              "corrplot", "rmarkdown", "knitr", "psych", "kableExtra")
missing <- packages[!vapply(packages, requireNamespace, logical(1), quietly = TRUE)]
if (length(missing) > 0) install.packages(missing)
