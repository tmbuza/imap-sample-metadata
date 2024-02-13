#!/Users/tmbuza/opt/anaconda3/envs/snakemake/bin/Rscript

# NCBI BioProject PRJNA685168: Bushmeat samples
library(tidyverse, suppressPackageStartupMessages())

PRJNA477349 <- read_csv("data/PRJNA477349_metadata.csv", show_col_types = FALSE)

PRJNA685168 <- read_csv("data/PRJNA685168_metadata.csv", show_col_types = FALSE)

PRJEB21612 <- read_csv("data/PRJEB21612_metadata.csv", show_col_types = FALSE)

PRJNA802976 <- read_csv("data/PRJNA802976_metadata.csv", show_col_types = FALSE)

runinfo = rbind(PRJNA477349, PRJNA685168)
runinfo = rbind(runinfo, PRJEB21612)
runinfo = rbind(runinfo, PRJNA802976)

runinfo %>% 
  select(Run, bases, avgLength, size_MB, LibraryStrategy,Platform,Model) %>% 
  filter(LibraryStrategy=='AMPLICON') %>% 
  write_csv("data/metadata_16S.csv")

runinfo %>% 
  select(Run, bases, avgLength, size_MB, LibraryStrategy,Platform,Model) %>% 
  filter(LibraryStrategy=='WGS') %>% 
  write_csv("data/metadata_WGS.csv")

