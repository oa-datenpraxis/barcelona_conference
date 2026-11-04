# APC link analysis: Poster Submission to the 2026 Conference of the Barcelona Declaration on Open Research Information

This repository contains the materials for our submission to the **2026 Conference of the Barcelona Declaration on Open Research Information**. It includes the poster, the accompanying computational notebook, and the data and code used for the underlying analysis.

## Repository Structure

- APC_link_analysis (Analysis material on the link between APC paying institution and author position)
  - computational_notebook.qmd (Quarto source of the computational notebook)
  - computational_notebook.html (Rendered notebook)
  - computational_notebook_files/ (Auto-generated supporting files for the notebook)
  - apc_link_poster.qmd (Quarto source of the poster)
  - apc_link_poster.pdf (Rendered poster PDF)
  - data/ (Data and query script used in the analysis)
  - images/ (Figures used in the poster and notebook)
  - refs.bib (Bibliography BibTeX file)
  - apa.csl (APA citation style)
  - CfP.txt (Conference Call for Papers)
  - .quarto/typst (Quarto cache and Typst files)
- Barcelona_Conference.Rproj (RStudio project file)
- .gitignore

### Data not included in this repository

The file `data/res.csv` is **not included** because it exceeds GitHub's file size limit. It is the result of a BigQuery query and can be re-created by anyone with access to BigQuery by running the query in `data/bigquery.R`. Save the result as `data/res.csv` before rendering the notebook.

## Contact

[info.oa-datenpraxis@listserv.dfn.de](mailto:info.oa-datenpraxis@listserv.dfn.de)
