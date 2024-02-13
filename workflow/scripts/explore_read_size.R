#!/Users/tmbuza/opt/anaconda3/envs/snakemake/bin/Rscript

library(tidyverse, suppressPackageStartupMessages())

# Ascending order
read_csv("data/metadata.csv", show_col_types = FALSE) %>% 
  select(run, bioproject, bases) %>% 
  arrange(round(bases*1E5, digits = 0)) %>% 
  head(5) %>% 
  write_csv("results/read_size_asc.csv")


# Descending order
read_csv("data/metadata.csv", show_col_types = FALSE) %>% 
  select(run, bioproject, bases) %>% 
  arrange(round(-bases*1E5, digits = 0)) %>% 
  head(5) %>% 
  write_csv("results/read_size_desc.csv")

