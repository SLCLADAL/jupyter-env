# install.R for SLCLADAL/jupyter-env
# Last updated: 2025 — rebuilt for the 8 LADAL notebook tools.
# Pushing this file triggers a fresh Binder image build.

# ── Core data wrangling ───────────────────────────────────────────────
install.packages("dplyr")
install.packages("tidyr")
install.packages("tibble")
install.packages("readr")
install.packages("stringr")
install.packages("stringi")
install.packages("magrittr")
install.packages("here")

# ── File I/O ──────────────────────────────────────────────────────────
install.packages("readxl")
install.packages("writexl")
install.packages("zip")

# ── Visualisation ─────────────────────────────────────────────────────
install.packages("ggplot2")
install.packages("ggraph")
install.packages("RColorBrewer")
install.packages("scales")
install.packages("viridis")

# ── Corpus and text analysis ──────────────────────────────────────────
install.packages("quanteda")
install.packages("quanteda.textstats")
install.packages("quanteda.textplots")
install.packages("tidytext")
install.packages("tokenizers")
install.packages("SnowballC")

# ── Part-of-speech tagging ────────────────────────────────────────────
install.packages("udpipe")

# ── Sentiment analysis ────────────────────────────────────────────────
install.packages("syuzhet")

# ── Topic modelling ───────────────────────────────────────────────────
install.packages("topicmodels")

# ── Network analysis ──────────────────────────────────────────────────
install.packages("igraph")
install.packages("tidygraph")