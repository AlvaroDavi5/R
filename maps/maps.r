# install packages
install.packages(
	c(
		"leaflet",
		"rgdal",
		"geobr",
		"electionsBR",
		"dplyr"
	),
	dependencies=TRUE,
	repos="https://cran.fiocruz.br/"
)


# import libraries
library(rgdal) # shape loader
library(leaflet) # map manipulator
library(geobr) # maps and Brazil geography pack
library(ggplot2) # charts plotter
library(electionsBR) # get Brazil elections data
library(dplyr) # to use %>%


# set map
map_ufes <- leaflet()
map_ufes <- addTiles(map_ufes)
# add marker
map_ufes <- addMarkers(
	map_ufes,
	data=getMapData(NULL),
	lat=-20.277078,
	lng=-40.303407,
	label="UFES",
	popup="Universidade Federal do Espirito Santo"
)
# add circles
map_ufes <- addCircles(
	map_ufes,
	lat=-20.272866,
	lng=-40.305513,
	radius=100,
	color="#4C8FDF",
	label="CT",
	weight=5,
	opacity=0.5,
	fill=TRUE,
	fillColor="#4C8FDF",
	fillOpacity=0.2,
)
map_ufes <- addCircles(
	map_ufes,
	lat=-20.276154,
	lng=-40.305682,
	radius=67,
	color="#E91FEE",
	label="CCJE",
	weight=5,
	opacity=0.5,
	fill=TRUE,
	fillColor="#E91FEE",
	fillOpacity=0.2,
)
map_ufes <- addCircles(
	map_ufes,
	lat=-20.275028,
	lng=-40.304198,
	radius=40,
	color="#824CDF",
	label="CCHN",
	weight=5,
	opacity=0.5,
	fill=TRUE,
	fillColor="#824CDF",
	fillOpacity=0.2,
)
map_ufes <- addCircles(
	map_ufes,
	lat=-20.275726,
	lng=-40.303695,
	radius=30,
	color="#88EE1F",
	label="CCE",
	weight=5,
	opacity=0.5,
	fill=TRUE,
	fillColor="#88EE1F",
	fillOpacity=0.2,
)
map_ufes <- addCircles(
	map_ufes,
	lat=-20.274493,
	lng=-40.304746,
	radius=20,
	color="#FEF700",
	label="CE",
	weight=5,
	opacity=0.5,
	fill=TRUE,
	fillColor="#FEF700",
	fillOpacity=0.2,
)
map_ufes <- addCircles(
	map_ufes,
	lat=-20.279090,
	lng=-40.303166,
	radius=90,
	color="#FE0000",
	label="CA",
	weight=5,
	opacity=0.5,
	fill=TRUE,
	fillColor="#FE0000",
	fillOpacity=0.2,
)
map_ufes <- addCircles(
	map_ufes,
	lat=-20.281012,
	lng=-40.303802,
	radius=85,
	color="#FE8400",
	label="CEFD",
	weight=5,
	opacity=0.5,
	fill=TRUE,
	fillColor="#FE8400",
	fillOpacity=0.2,
)


# set candidate
#df_cand <- candidate_local(2016, uf="ES", export=FALSE, ascii=FALSE, encoding="utf8") slow download
df_cand <- read.csv("./data/consulta_cand_2018_ES.csv", header=TRUE, sep=",", encoding="utf8")
