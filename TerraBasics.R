#####
## Terra basics
## Author: Anna Stroh
## Date created: November 5, 2024
#####

library(terra) # raster work

library(ggplot2)
library(tidyterra) # for SpatRaster/SpatVector plotting 
library(viridis) # viridis colour-scale

## Creating simple raster from matrix
m <- matrix(1:25, nrow=5, ncol=5)
rm <- rast(m)

#png(filename = "simple raster example.png") # for saving
plot(rm)
#dev.off()

###----------------------------------------------------------

## Reading rasters
# for single layer example
f <- system.file("ex/elev.tif", package="terra")
example <- rast(f) 
print(example)

# for multilayer example
f2 <- system.file("ex/logo.tif", package="terra")
multilayer <- rast(f2)
print(multilayer)

###----------------------------------------------------------

## Plotting in terra
# single layer
plot(example, main = "Single layer raster") 

# multilayer
plot(multilayer, main = "Multilayer raster") # automatically plots out layer panels

## Plotting in ggplot2
# single layer
ggplot() +
  geom_spatraster(data = example, # plot raster
                  aes(fill = elevation)) + # layer name here
  scale_fill_viridis_c() +
  ggtitle("Single layer raster")

ggplot() + # improved layout - more pretty
  geom_spatraster(data = example, # plot raster
                  aes(fill = elevation)) + # layer name here
  scale_fill_viridis_c(na.value = "transparent") + # removes background
  coord_sf(crs = 4326) +
  labs(title = "Single layer raster",
       fill = "elevation") + 
  theme_minimal()

###----------------------------------------------------------

## Subset using [[ layer index/indices ]]
red <- multilayer[[1]] # subsets to first layer
red_green <- multilayer[[1:2]] # or multiple layers

## Subset using subset()
red2 <- subset(multilayer, 1) # also layer index

















