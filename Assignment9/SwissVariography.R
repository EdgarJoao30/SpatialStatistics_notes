# To answer the questions below, you will have to look up some videos and tutorials.
# Optional ressources are...
# 1.) videos by Edward Isaaks (e.g.: https://tinyurl.com/39kc9mah and/or https://tinyurl.com/2b9tpz3u)
# 2.) the ESRI Help starting with https://tinyurl.com/44u6r4zv
# 3.) or the documentations of R functions variogram and vgm, which are both part of library gstat. 

library(gstat)
library(sf)

#import swiss precipitation data
dat_swiss <- sf::st_read("data/dataobserved.shp")

# The following line calculates a sample variogram from precipitation data. What is a variogram?
# Explain in your own words (~150W)
# What is the purpose of parameter 'width'? See documentation of function 'variogram' https://tinyurl.com/ywum9y2v) and explain in your own words (~50W).
empirical_variogram <- gstat::variogram(Z_1_10MM~1, data = dat_swiss, width = 5000)

# The next line calculates a variogram model. What is a variogram model?
# Describe in your own words (~150W).
estimated_variogram.model <- gstat::vgm(15000, 'Sph', 70000, 0.1)

# The variogram model (in the line above) is defined by parameters partial sill, range and nugget
# What type of model is used (see parameter 'Sph') and what is partial sill, range and nugget (~150W)?

#plot sample variogram and variogram model
plot(empirical_variogram, model = estimated_variogram.model)

# Define another variogram model of your choice to fit the sample variogram from above (see documentation of R function 'vgm').

# directional sample variography (see parameter 'alpha')
empirical_variogram.dir <- gstat::variogram(Z_1_10MM~1, data = dat_swiss, width = 10000, alpha=c(0,45,90,135,180,225,270,315))
plot(empirical_variogram.dir) 

# Directional sample variogams consider anisotropy in spatial autocorrelation.
# Why does alpha 0 and 180, 270 and 90, 315 and 135, 225 and 45 yield the same results, respectively? Explain in your own words (~50W).

# Create a simple map of variable Z_1_10MM. In the case of alpha = 135 (and others) semivariance increases and then decreases with distance.
# In the case of alpha = 45 and alpha = 225 semivariances increase very slowly with distance. 
# Compare to your map and try to explain these patterns (~100W).







