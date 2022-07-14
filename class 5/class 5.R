library(sf)
library(tidyverse)

df <- st_read('~/Desktop/SpatStat/class 5/LondonWardStats/LondonWardStats.shp')

ggplot(df) +
  geom_sf(aes(fill = Average.GC), color = 'white', size = .2) +
  scale_fill_viridis_c(direction = -1)+
  coord_sf() +
  theme_minimal() +
  labs(fill = 'Average GC')

Regressiondata <- df %>%
  dplyr::select(Average.GC, Unauthoris)

ggplot2::ggplot(Regressiondata,
                aes(
                  x = Unauthoris,
                  y = Average.GC
                )
) +
  ggplot2::xlab("Unauthorised absence in all schools percent
2013") +
  ggplot2::ylab("Average GCSE capped point scores 2014") +
  ggplot2::geom_point(color="blue") +
  ggplot2::geom_smooth(method=lm , color="red", fill="#69b3a2",
                       se=FALSE) +
  ggplot2::theme_minimal() 

#now model
model1 <- Regressiondata %>%
  lm(Average.GC ~ Unauthoris, data=.)
#show the summary of those outputs
summary(model1)

p <- (model1$coefficients['Unauthoris'] * 5) + model1$coefficients['(Intercept)']
