install.packages("leaflet", repos="https://cran.fiocruz.br/", dependencies=TRUE)
install.packages(c("rgdal", "sf", "readr", "rio", "dplyr", "ggplot2", "leaflet", "geobr"), dependencies=TRUE)


library(rgdal)
library(leaflet)
library(geobr)
library(ggplot2)
library(dplyr)
library(sf)
library(readr)
library(rio)


m <- leaflet()
m <- addTiles(m)
m <- addMarkers(m, lng=174.768, lat=-36.852, popup="The birthplace of R")
m

