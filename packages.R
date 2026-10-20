packages <- c("readxl", "dplyr", "ggplot2", "car", "biotools", "rmarkdown", "knitr")
missing <- packages[!vapply(packages, requireNamespace, logical(1), quietly = TRUE)]
if (length(missing) > 0) install.packages(missing)
