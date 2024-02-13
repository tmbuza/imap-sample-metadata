#!/Users/tmbuza/opt/anaconda3/envs/snakemake/bin/Rscript

# NCBI BioProject PRJNA477349: Bushmeat samples
library(tidyverse, suppressPackageStartupMessages())

PRJNA477349 <- read_csv("data/runinfo_PRJNA477349.csv", show_col_types = FALSE) %>% colnames() %>% as.data.frame()
colnames(PRJNA477349) <- "PRJNA477349"

PRJNA685168 <- read_csv("data/runinfo_PRJNA685168.csv", show_col_types = FALSE) %>% colnames() %>% as.data.frame()
colnames(PRJNA685168) <- "PRJNA685168"

PRJEB21612 <- read_csv("data/runinfo_PRJEB21612.csv", show_col_types = FALSE) %>% colnames() %>% as.data.frame()
colnames(PRJEB21612) <- "PRJEB21612"

PRJNA802976 <- read_csv("data/runinfo_PRJNA802976.csv", show_col_types = FALSE) %>% colnames() %>% as.data.frame()
colnames(PRJNA802976) <- "PRJNA802976"

runinfo = cbind(PRJNA477349, PRJNA685168)
runinfo = cbind(runinfo, PRJEB21612)
runinfo_cols = cbind(runinfo, PRJNA802976)
write_csv(runinfo_cols, "data/runinfo_colnames.csv")