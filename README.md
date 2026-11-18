# APC link analysis: Poster Submission to the 2026 Conference of the Barcelona Declaration on Open Research Information

<!-- badges: start -->

[![License: CC BY 4.0 (Poster)](https://img.shields.io/badge/Poster-CC_BY_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)
[![License: CC0 1.0 (Notebook and Code)](https://img.shields.io/badge/Notebook_and_Code-CC0_1.0-lightgrey.svg)](https://creativecommons.org/publicdomain/zero/1.0/)

<!-- badges: end -->

This repository contains the materials for our submission to the **2026 Conference of the Barcelona Declaration on Open Research Information**. It includes the poster, the accompanying computational notebook, and the data and code used for the underlying analysis.

## Repository Structure

- **APC_link_analysis** (Folder containing the material for the analysis on the link between APC paying institution and author position)
  - **computational_notebook.qmd:** Quarto source of the computational notebook
  - **computational_notebook.html:** Rendered notebook 
  - **computational_notebook_files/:** folder containing the auto-generated supporting files for the notebook
  - **apc_link_poster.qmd:** Quarto source file of the poster
  - **apc_link_poster.pdf:** Rendered poster file in PDF format
  - **data/:** folder containing the data and query script used in the analysis
  - **images/:** folder containing the figures used in the poster and notebook
  - **refs.bib:** Bibliography BibTeX file
  - **apa.csl:** APA citation style file
  - **.quarto/typst:** Quarto cache and Typst files
- **Barcelona_Conference.Rproj:** RStudio project file
- **LICENSE-poster.md:** Licence notice for the poster (CC BY 4.0)
- **LICENSE-notebook.md:** Licence notice for the notebook and code (CC0 1.0)
- .gitignore

### Data not included in this repository

The file `data/res.csv` is **not included** because it exceeds GitHub's file size limit. It is the result of a BigQuery query and can be re-created by anyone with access to BigQuery by running the query in `data/bigquery.R`. Save the result as `data/res.csv` before rendering the notebook.

## Licence

| Component | Licence |
|---|---|
| Poster (`apc_link_poster.qmd`, `apc_link_poster.pdf`) and figures in `images/` | [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) (see [LICENSE-poster.md](LICENSE-poster.md)) |
| Computational notebook (`computational_notebook.qmd`, `computational_notebook.html`) and analysis code (incl. `data/bigquery.R`) | [CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/) (see [LICENSE-notebook.md](LICENSE-notebook.md)) |
| Data | Under the respective licences of the original sources (see below) |

### Data sources and their licences

The analysis builds on the following third-party data. These are **not** covered by the licences above and remain under their original terms:

- **OpenAlex**: [CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/), see [OpenAlex pricing and data licence](https://help.openalex.org/access/pricing/#free-data-paid-services).
- **OpenAPC**: [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/), see [Zenodo record](https://doi.org/10.5281/zenodo.22080547).
- **ROR (Research Organization Registry)**: [CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/), see [Zenodo record](https://doi.org/10.5281/zenodo.21773148).

Anyone re-using derived data should check and comply with the licence terms of each source. In particular, OpenAPC data requires attribution under CC BY 4.0.

### Third-party files

Some files in this repository were not created by the authors and are **not** covered by the licences above. They remain under their original licences and terms of use:

- **apa.csl:** APA citation style from the [Citation Style Language](https://citationstyles.org/) project, licensed under [CC BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0/).
- **Quarto, Typst and R packages** (e.g. contents of `.quarto/` and `computational_notebook_files/`): auto-generated or third-party files, subject to their respective open-source licences.

## Contact

[info.oa-datenpraxis@listserv.dfn.de](mailto:info.oa-datenpraxis@listserv.dfn.de)
