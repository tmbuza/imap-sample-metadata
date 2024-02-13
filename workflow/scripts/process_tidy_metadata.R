library(tidyverse, suppressPackageStartupMessages())

read_csv("data/PRJNA477349_SraRunTable.csv", show_col_types = FALSE) %>%
  rename_all(tolower) %>%
  select_if(~sum((!is.na(.))) > 0) %>% # Remove empty columns
  mutate(
    geo_loc_name = str_replace_all(geo_loc_name, "Tanzania: ", ""),
    geo_loc_name = str_replace_all(geo_loc_name, "The Greater Serengeti Ecosystem", "Serengeti"),
    geo_loc_name = str_replace_all(geo_loc_name, " Ecosystem", ""),
    isolate = str_replace_all(isolate, "_\\d*$", ""),
    lat_lon = str_replace_all(lat_lon, " E$", ""),
    latitude = as.numeric(str_replace_all(lat_lon, " S.*", "")) * -1,
    longitude = as.numeric(str_replace_all(lat_lon, ".*S ", ""))) %>% 
  rename(ecosystem = geo_loc_name) %>%
  rename(description = host) %>% 
  # mutate(bases = round(bases/1E6, digits = 0)) %>% 
  select(run, bioproject, type = `assay type`, librarylayout, organism,  ecosystem, isolate, latitude, longitude, bases, description) %>%
  write_csv("data/PRJNA477349_tidy_metadata.csv")

library(tidyverse)
read_csv("data/PRJNA802976_SraRunTable.csv", show_col_types = FALSE) %>%  
  rename_all(tolower) %>%
  select_if(~sum((!is.na(.))) > 0) %>%
  filter(!is.na(lat_lon)) %>%
  mutate(
    lat_lon = str_replace_all(lat_lon, " E$", ""),
    latitude = as.numeric(str_replace_all(lat_lon, " N.*", "")),
    longitude = as.numeric(str_replace_all(lat_lon, ".*N ", ""))) %>% 
  # mutate(bases = round(bases/1E6, digits = 0)) %>% 
  select(run, bioproject, type = `assay type`, librarylayout, organism, latitude, longitude, bases) %>% 
  write_csv("data/PRJNA802976_tidy_metadata.csv")

library(tidyverse)
read_csv("data/PRJNA322554_SraRunTable.csv", show_col_types = FALSE) %>%  
  rename_all(tolower) %>%
  select_if(~sum((!is.na(.))) > 0) %>%
  filter(!is.na(lat_lon)) %>%
  mutate(
    lat_lon = str_replace_all(lat_lon, " W$", ""),
    latitude = as.numeric(str_replace_all(lat_lon, " N.*", "")),
    longitude = as.numeric(str_replace_all(lat_lon, ".*N ", "")) * -1) %>% 
  # mutate(bases = round(bases/1E6, digits = 0)) %>% 
  select(run, bioproject, type = `assay type`, librarylayout, organism, body_site, latitude, longitude, bases) %>% 
  write_csv("data/PRJNA322554_tidy_metadata.csv")

library(tidyverse)
read_csv("data/PRJNA937707_SraRunTable.csv", show_col_types = FALSE) %>%  
  rename_all(tolower) %>%
  select_if(~sum((!is.na(.))) > 0) %>%
  filter(!is.na(lat_lon)) %>%
  mutate(
    isolation_source = str_replace_all(isolation_source, " \\(replicate\\)", ""),
    lat_lon = str_replace_all(lat_lon, " W$", ""),
    latitude = as.numeric(str_replace_all(lat_lon, " N.*", "")),
    longitude = as.numeric(str_replace_all(lat_lon, ".*N ", "")) * -1) %>%
  # mutate(bases = round(bases/1E6, digits = 0)) %>% 
  select(run, bioproject, type = `assay type`, librarylayout, organism, isolation_source, latitude, longitude, bases) %>% 
  write_csv("data/PRJNA937707_tidy_metadata.csv")
 
library(tidyverse)
read_csv("data/PRJNA589182_SraRunTable.csv", show_col_types = FALSE) %>%  
  rename_all(tolower) %>%
  rename(lat_lon = "lat-lon") %>%
  filter(bioproject=="PRJNA589182") %>%
  select_if(~sum((!is.na(.))) > 0) %>% 
  mutate(
    replicate = str_replace_all(replicate, " biologic.*", ""),
    lat_lon = str_replace_all(lat_lon, " W$", ""),
    latitude = as.numeric(str_replace_all(lat_lon, " N.*", "")),
    longitude = as.numeric(str_replace_all(lat_lon, ".*N ", ""))) %>%
  # mutate(bases = round(bases/1E6, digits = 0)) %>% 
  select(run, bioproject, type = `assay type`, librarylayout, organism, replicate, latitude, longitude, bases) %>% 
  write_csv("data/PRJNA589182_tidy_metadata.csv")
 
library(tidyverse)
read_csv("data/PRJEB13870_SraRunTable.csv", show_col_types = FALSE) %>%  
  rename_all(tolower) %>%
  rename(latitude = "geographic_location_(latitude)") %>%
  rename(longitude = "geographic_location_(longitude)") %>%
  filter(bioproject=="PRJEB13870") %>%
  select_if(~sum((!is.na(.))) > 0) %>% 
  mutate(
    latitude = str_replace_all(latitude, " N$", ""),
    longitude = str_replace_all(longitude, "116. 3 E$", "116.3")) %>%
  select_if(~sum((!is.na(.))) > 0) %>% 
  # mutate(bases = round(bases/1E6, digits = 0)) %>% 
  select(run, bioproject, type = `assay type`, librarylayout, organism, latitude, longitude, bases) %>% 
  write_csv("data/PRJEB13870_tidy_metadata.csv")

library(tidyverse)
read_csv("data/PRJNA208226_SraRunTable.csv", show_col_types = FALSE) %>%  
  rename(latitude = "GPS_Latitute_S") %>%
  rename(longitude = "GPS_Longitude_W") %>%
  rename_all(tolower) %>%
  filter(bioproject=="PRJNA208226") %>%
  select_if(~sum((!is.na(.))) > 0) %>% 
  mutate(
    latitude = str_replace_all(latitude, "\\.*'$", ""),
    latitude = str_replace_all(latitude, "\\.*_$", ""),
    latitude = str_replace_all(latitude, "\\.", ""),
    latitude = str_replace_all(latitude, " o ", "."),
    latitude = str_replace_all(latitude, "o ", "."),
    latitude = as.numeric(latitude) * -1) %>% 
  mutate(
    longitude = str_replace_all(longitude, "\\.*'$", ""),
    longitude = str_replace_all(longitude, "\\.*_$", ""),
    longitude = str_replace_all(longitude, "\\.", ""),
    longitude = str_replace_all(longitude, " o ", "."),
    longitude = str_replace_all(longitude, "o ", "."),
    longitude = str_replace_all(longitude, "^0", ""),
    longitude = as.numeric(longitude) * -1) %>% 
  select_if(~sum((!is.na(.))) > 0) %>% 
  # mutate(bases = round(bases/1E6, digits = 0)) %>% 
  select(run, bioproject, type = `assay type`, librarylayout, organism, locname = "sample_location_full_name", latitude, longitude, bases) %>% 
  mutate(locname = str_replace_all(locname, "Cha\\?aral", "Chanaral")) %>% 
  write_csv("data/PRJNA208226_tidy_metadata.csv")
