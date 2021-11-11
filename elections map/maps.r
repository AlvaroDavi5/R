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
		"sf",
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
library(sf) # shapefile loader
library(dplyr) # to use %>%


# temp path
td <- tempdir()
tf <- tempfile()


# load shapes
limits <- read_sf("./shapefiles/Bases_Cartograficas/lml_cidade_p.shp")
limits <- readOGR(dsn="./shapefiles/Bases_Cartograficas/", layer="lml_cidade_p", encoding="UTF-8", verbose=FALSE)
states <- readOGR(dsn="./shapefiles/Malhas_Territoriais/Unidades_Federativas/BR_UF-2020", layer="BR_UF_2020", encoding="UTF-8", verbose=FALSE)
cities <- readOGR(dsn="./shapefiles/Malhas_Territoriais/Municipios/ES_municipios-2020", layer="ES_Municipios_2020", encoding="UTF-8", verbose=FALSE)
districts <- readOGR(dsn="./shapefiles/Malhas_Territoriais/Distritos/ES_distritos-2010",layer="32DSE250GC_SIR", encoding="UTF-8", verbose=FALSE)


# set map
general_map <- leaflet(data=districts)
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
general_map <- addPolygons(data=districts, weight=0.1, fillColor="green", color="blue", fillOpacity=0.9, smoothFactor=0.5)

# set candidate
#df_cand <- candidate_local(2016, uf="ES", export=FALSE, ascii=FALSE, encoding="utf8") slow download
df_cand <- read.csv("./data/consulta_cand_2018_ES.csv", header=TRUE, sep=",", encoding="utf8")
