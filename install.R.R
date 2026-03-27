# install.R for SLCLADAL/jupyter-env
# Updated 2025-03-27

options(warn = 2)

install_pkg <- function(pkg) {
  message("Installing: ", pkg)
  install.packages(pkg, repos = "https://cloud.r-project.org",
                   dependencies = TRUE, quiet = FALSE)
  if (!requireNamespace(pkg, quietly = TRUE))
    stop("Failed to install: ", pkg)
  message("OK: ", pkg)
}

pkgs <- c(
  "dplyr", "tidyr", "tibble", "readr",
  "stringr", "stringi", "magrittr", "here",
  "readxl", "writexl", "zip",
  "ggplot2", "ggraph", "RColorBrewer", "scales", "viridis",
  "quanteda", "quanteda.textstats", "quanteda.textplots",
  "tidytext", "tokenizers", "SnowballC",
  "udpipe",
  "syuzhet",
  "topicmodels",
  "igraph", "tidygraph"
)

for (pkg in pkgs) install_pkg(pkg)

# ── Pre-download UDPipe language models ──────────────────────────────
# Done here (not in postBuild) so the correct R library path is active.
message("\nPre-downloading UDPipe language models...")

model_dir <- file.path(Sys.getenv("HOME", "/home/jovyan"), "udpipe-models")
dir.create(model_dir, showWarnings = FALSE, recursive = TRUE)

models <- c(
  "english-ewt",
  "english-gum",
  "german-gsd",
  "french-gsd",
  "spanish-ancora",
  "italian-isdt",
  "dutch-alpino",
  "portuguese-bosque",
  "russian-gsd",
  "chinese-gsd",
  "arabic-padt",
  "japanese-gsd"
)

for (lang in models) {
  message("Downloading: ", lang)
  tryCatch({
    dl <- udpipe::udpipe_download_model(language = lang,
                                        model_dir = model_dir)
    if (isTRUE(dl$download_failed)) {
      message("WARNING: download failed for ", lang, " — skipping")
    } else {
      message("OK: ", lang)
    }
  }, error = function(e) {
    message("WARNING: error downloading ", lang, ": ", conditionMessage(e))
  })
}

downloaded <- list.files(model_dir, pattern = "\\.udpipe$")
message("Models pre-installed (", length(downloaded), "):")
for (f in downloaded) message("  ", f)

message("\nAll done.")