library(tidyverse, suppressPackageStartupMessages())

read_csv("data/metadata.csv", show_col_types = FALSE) %>% 
  rename_all(tolower) %>% 
  ggplot(aes(x = bioproject, y = bases/1E6, fill = bioproject)) +
  geom_col(position = "dodge") +
  coord_flip() +
  labs(x = "NCBI BioProject", y = "Read size (milion bases)", fill="BioProject") +
  theme_light()

ggsave(file="figures/read_size.png", width=10, height=10)
ggsave(file="figures/read_size.svg", width=10, height=10)



read_csv("data/PRJNA477349_tidy_metadata.csv", show_col_types = FALSE) %>% 
  rename_all(tolower) %>% 
  ggplot(aes(x = isolate, y = bases/1E6, fill = ecosystem)) +
  geom_col(position = "dodge") +
  coord_flip() +
  labs(x = "PRJNA477349 BioProject", y = "Read size (milion bases)", fill="Ecosystem") +
  theme_light()

ggsave(file="figures/PRJNA477349_read_size.png", width=10, height=10)
ggsave(file="figures/PRJNA477349_read_size.svg", width=10, height=10)


read_csv("data/PRJNA208226_tidy_metadata.csv", show_col_types = FALSE) %>% 
  rename_all(tolower) %>% 
  ggplot(aes(x = locname, y = bases/1E6, fill = locname)) +
  geom_col(position = "dodge") +
  coord_flip() +
  labs(x = "PRJNA208226 BioProject", y = "Read size (milion bases)", fill="Location") +
  theme_light()

ggsave(file="figures/PRJNA208226_read_size.png", width=10, height=10)
ggsave(file="figures/PRJNA208226_read_size.svg", width=10, height=10)