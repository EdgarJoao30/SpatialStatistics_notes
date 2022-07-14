library(ape)
library(sf)
library(ggplot2)
library(leaflet)
library(simplevis)

ohio <- sf::st_read("~/Desktop/SpatStat/class 7/data/ohio_cities.shp")

#map as leaflet, leaf_sf_col is leaflet
#wrapper for sf objects
simplevis::leaf_sf_col(ohio,
                       col_var = POP1990,
                       col_breaks_n = 3)

ohio.dist <-
  as.matrix(dist(sf::st_coordinates(ohio)))

ohio.dist.inv <- 1/ohio.dist

diag(ohio.dist.inv) <- 0

ape::Moran.I(ohio$POP1990, ohio.dist.inv)

