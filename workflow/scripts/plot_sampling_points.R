library(tidyverse, suppressPackageStartupMessages())
library(leaflet)
library(leaflet.providers)
library(htmlwidgets)
library(webshot)
library(mapview)

# if (!dir.exists("images/gpsfiles")){dir.create("images/gpsfiles")}

metadata <- read_csv("data/metadata.csv", show_col_types = FALSE)

minLat <- min(metadata$latitude) - 1
minLon <- min(metadata$longitude) + 0
maxLat <- max(metadata$latitude) + .5
maxLon <- max(metadata$longitude) + 0

m <- metadata %>%
  leaflet() %>% 
  addProviderTiles(providers$Esri.NatGeoWorldMap) %>%
  fitBounds(minLon, minLat, maxLon, maxLat) %>%
  addMarkers(lng = ~longitude, lat = ~latitude, popup = ~bioproject, label = ~ c(bioproject)) %>%
  addCircles(color="magenta", radius = log1p(metadata$longitude) * 10)

## save html to png
saveWidget(m, "images/sample_gps.html", selfcontained = FALSE)
webshot("images/sample_gps.html", file = "images/sample_gps.png",
        cliprect = "viewport")

