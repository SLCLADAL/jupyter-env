# install.R for SLCLADAL/jupyter-env
# Updated 2025-03-27

# Stop on any installation error so build failures are visible
options(warn = 2)  # treat warnings as errors during install

install_pkg <- function(pkg) {
  message("Installing: ", pkg)
  install.packages(pkg, repos = "https://cloud.r-project.org",
                   dependencies = TRUE, quiet = FALSE)
  if (!requireNamespace(pkg, quietly = TRUE))
    stop("Failed to install: ", pkg)
  message("OK: ", pkg)
}

pkgs <- c(
  # Core data wrangling
  "dplyr", "tidyr", "tibble", "readr",
  "stringr", "stringi", "magrittr", "here",

  # File I/O
  "readxl", "writexl", "zip",

  # Visualisation
  "ggplot2", "ggraph", "RColorBrewer", "scales", "viridis",

  # Corpus and text analysis
  "quanteda", "quanteda.textstats", "quanteda.textplots",
  "tidytext", "tokenizers", "SnowballC",

  # Part-of-speech tagging
  "udpipe",

  # Sentiment analysis
  "syuzhet",

  # Topic modelling
  "topicmodels",

  # Network analysis
  "igraph", "tidygraph"
)

for (pkg in pkgs) install_pkg(pkg)

message("All packages installed successfully.")
