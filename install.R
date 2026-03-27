# install.R for SLCLADAL/jupyter-env
# Updated 2025-03-27

# Install into the same library path Binder uses for all other packages
lib <- "/srv/rlibs"
dir.create(lib, showWarnings = FALSE, recursive = TRUE)

install_pkg <- function(pkg) {
  if (requireNamespace(pkg, quietly = TRUE, lib.loc = lib)) {
    message("Already installed: ", pkg)
    return(invisible(NULL))
  }
  message("Installing: ", pkg)
  install.packages(pkg,
                   lib         = lib,
                   repos       = "https://cloud.r-project.org",
                   dependencies = TRUE,
                   quiet       = FALSE)
  if (!requireNamespace(pkg, quietly = TRUE, lib.loc = lib))
    stop("FAILED to install: ", pkg)
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

# Pre-download UDPipe language models
message("\nPre-downloading UDPipe language models...")
.libPaths(c(lib, .libPaths()))

model_dir <- file.path(Sys.getenv("HOME", "/home/jovyan"), "udpipe-models")
dir.create(model_dir, showWarnings = FALSE, recursive = TRUE)

models <- c(
  "english-ewt", "english-gum",
  "german-gsd", "french-gsd", "spanish-ancora",
  "italian-isdt", "dutch-alpino", "portuguese-bosque",
  "russian-gsd", "chinese-gsd", "arabic-padt", "japanese-gsd"
)

for (lang in models) {
  tryCatch({
    message("Downloading: ", lang)
    dl <- udpipe::udpipe_download_model(language = lang, model_dir = model_dir)
    if (isTRUE(dl$download_failed)) {
      message("WARNING: download failed for ", lang)
    } else {
      message("OK: ", lang)
    }
  }, error = function(e) {
    message("WARNING: error downloading ", lang, ": ", conditionMessage(e))
  })
}

downloaded <- list.files(model_dir, pattern = "\\.udpipe$")
message("Models pre-installed: ", length(downloaded))
message("All done.")