
library(tidyverse, suppressPackageStartupMessages())

if (!dir.exists("config")) {dir.create("config")}
if (!dir.exists("resources")) {dir.create("resources")}

samples <- read_csv("data/metadata.csv", show_col_types = FALSE) %>%  
  rename_all(tolower) %>% 
  filter(bioproject != "PRJNA477349", bioproject !="PRJEB13870") %>% 
  filter(bases >100000) %>% 
  filter(librarylayout == "PAIRED") %>% 
  
  select(sample_name = run, bioproject)

samples %>% 
  filter()
write_tsv(samples, "config/pe_samples.tsv")

metadata <- left_join(samples, read_csv("data/metadata.csv", show_col_types = FALSE), by=c(sample_name = "run", bioproject = "bioproject")) %>%  
  rename_all(tolower) %>% 
  mutate(unit_name="NA", .after=sample_name,
         fq1="NA",
         fq2="NA",
         sra=sample_name,
         adapters="NA")

metadata %>%
  select(1:6) %>% 
  write_tsv("config/pe_units.tsv")


metadata %>%
  write_tsv("resources/pe_metadata.tsv")
