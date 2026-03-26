# LADAL Jupyter Notebook Environment (`jupyter-env`)

This repository holds the **R package environment** for the [LADAL Jupyter Notebook Tools](https://github.com/SLCLADAL/jupyter).
It is kept separate from the notebook content so that updating a notebook does not trigger a full Binder rebuild — only changes to this repo cause the environment image to be rebuilt.

---

## How it works

Binder uses [nbgitpuller](https://nbgitpuller.readthedocs.io/) to combine two repositories:

1. **This repo** (`jupyter-env`) — defines the R version and all packages. Binder builds a Docker image from this. Once built, it is cached and reused.
2. **Content repo** (`jupyter`) — contains the `.ipynb` notebook files. Pulled fresh on every launch, so notebook edits appear immediately without a rebuild.

This means:
- Editing a notebook → changes appear instantly on next launch (no rebuild).
- Adding or changing an R package → triggers a Binder rebuild (~10–20 minutes, then cached).

---

## Files

| File | Purpose |
|---|---|
| `runtime.txt` | Specifies the R version (format: `r-x.x.x-YYYY-MM-DD`) |
| `install.R` | Installs all required R packages |
| `requirements.txt` | Installs Python packages (`nbgitpuller`, `ipywidgets`) |
| `apt.txt` | System-level dependencies (if any) |

---

## R packages installed

The `install.R` file is deliberately minimal — only the packages actually used by the 8 notebook tools are included. This keeps build times as short as possible.

Packages are grouped by purpose:

- **Core data wrangling**: dplyr, tidyr, tibble, stringr, stringi, here
- **File I/O**: readxl, writexl, zip
- **Visualisation**: ggplot2, ggraph, scales, viridis, RColorBrewer
- **Corpus & text analysis**: quanteda, quanteda.textstats, tidytext, tokenizers, SnowballC
- **Part-of-speech tagging**: udpipe
- **Sentiment analysis**: syuzhet
- **Topic modelling**: topicmodels
- **Network analysis**: igraph, tidygraph

---

## Python packages

`requirements.txt` installs:

- `nbgitpuller` — required for the two-repo Binder launch pattern
- `ipywidgets>=8.0` — required for the interactive configuration widgets inside the notebooks

---

## Updating dependencies

To add or update an R package:

1. Edit `install.R`
2. Commit and push to `main`
3. Binder will automatically rebuild the image on next launch (takes 10–20 minutes; subsequent launches use the cache)

---

## Linked repositories

| Repo | Purpose |
|---|---|
| [SLCLADAL/jupyter](https://github.com/SLCLADAL/jupyter) | Notebook content |
| [SLCLADAL/jupyter-env](https://github.com/SLCLADAL/jupyter-env) | This repo — environment |

---

## License

[Apache 2.0](LICENSE) — © 2025 The University of Queensland / LADAL
