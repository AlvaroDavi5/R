ibge_base <- "https://portaldemapas.ibge.gov.br/portal.php#homepage"
ibge_geo_base <- "https://geoftp.ibge.gov.br/cartas_e_mapas/bases_cartograficas_continuas/bc250/versao2019/"
elections_base <- "https://cdn.tse.jus.br/estatistica/sead/odsele/consulta_cand/consulta_cand_2016.zip"


# install packages
'
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
'


# import libraries
library(rgdal) # shape loader
library(leaflet) # map manipulator
library(geobr) # maps and Brazil geography pack
library(ggplot2) # charts plotter
library(electionsBR) # get Brazil elections data
library(dplyr) # to use %>%


# set map
general_map <- leaflet()
general_map <- addTiles(general_map, group="OSM")
general_map <- addMarkers(
	general_map,
	data=getMapData(NULL),
	lat=-20.277078,
	lng=-40.303407,
	label="UFES",
	popup="Universidade Federal do Espirito Santo"
)
general_map <- addCircles(
	general_map,
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
general_map <- setView(general_map, lat=-20.276954, lng=-40.300955, zoom=20)
general_map <- addProviderTiles(general_map, providers$CartoDB.DarkMatter, group="Dark")
general_map <- addProviderTiles(general_map, providers$CartoDB.Positron, group="Light")
general_map <- addLayersControl(general_map, baseGroups=c("OSM", "Dark", "Light"))


# set candidate
#df_cand <- candidate_local(2016, uf="ES", export=FALSE, ascii=FALSE, encoding="utf8") slow download
df_cand <- read.csv("./data/consulta_cand_2018_ES.csv", header=TRUE, sep=",", encoding="utf8")
df_cand
