library(tidyverse)
library(here)
library(bigrquery)
library(DBI)


bq_con <- dbConnect(
  bigrquery::bigquery(),
  project = "subugoe-collaborative",
  dataset = "openalex_walden",
  billing = "subugoe-collaborative"
)

apc_de <- read_csv(here("data", "apc_de_20260824.csv"))
apc_ta <- read_csv(here("data", "transformative_agreements_20260824.csv"))
institution_matching <- read_csv(here("data", "apc_institutions_20260824.csv"))

apc_ta <- apc_ta |>
  select(-group_id)

apc_de <- apc_de |>
  mutate(
    opt_out = NA,
    agreement = NA
  ) |>
  relocate(opt_out, .before = publisher)

apc_df <- apc_de |>
  bind_rows(apc_ta) |>
  left_join(institution_matching, by = join_by(institution), keep = FALSE) |>
  relocate(ror_id, .before = institution) |>
  relocate(institution_full_name, .before = institution) |>
  filter(between(period, 2021, 2025)) |>
  filter(country == "DEU") |>
  select(-c(pmid, pmcid, ut, institution, institution_cubes_name))

write_csv(apc_df, here("data", "apc_df.csv"))


doi_lookup <- apc_df |>
  distinct(doi, period) |>
  filter(!is.na(doi)) |>
  mutate(
    doi_norm = tolower(paste0("https://doi.org/", doi)),
    period = as.integer(period)
  ) |>
  select(doi_norm, period)

# bq_table_delete(bq_table("subugoe-collaborative", "resources", "oad_apc_doi_lookup"))
bq_table_create("subugoe-collaborative.resources.oad_apc_doi_lookup", as_bq_fields(doi_lookup))
bq_table_upload(
  bq_table("subugoe-collaborative", "resources", "oad_apc_doi_lookup"),
  doi_lookup,
  write_disposition = "WRITE_TRUNCATE"
)


sql <- "
SELECT
  w.ids.doi AS doi,
  w.publication_year,
  a.author_position,
  a.is_corresponding,
  a.author.id AS author_id,
  a.author.display_name AS author_name,
  a.author.orcid,
  inst.ror,
  inst.display_name AS institution_display_name,
  inst.country_code
FROM `subugoe-collaborative.openalex_walden.works` AS w
JOIN `subugoe-collaborative.resources.oad_apc_doi_lookup` AS d
  ON LOWER(w.ids.doi) = d.doi_norm
CROSS JOIN UNNEST(w.authorships) AS a
LEFT JOIN UNNEST(a.institutions) AS inst
WHERE w.publication_year BETWEEN 2021 AND 2025
"

res <- dbGetQuery(bq_con, sql)

write_csv(res, here("data", "res.csv"))
