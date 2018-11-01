
library("ggplot2")
library("ggmap")
library(dplyr)

mean(data$Satisfaction,na.rm=TRUE)

data$Satisfaction[is.na(clean_data$Satisfaction)] <- 3.5 #closest to mean
fltmean1 <- data %>% group_by(Orgin.City) %>% summarize(mean1 = mean(Satisfaction))
fltmean1 <- as.data.frame(fltmean1)
fltmean1$place <- toString(paste(clean_data$Orgin.City,",",clean_data$Origin.State))
fltmean1 <- as.data.frame(fltmean1)
us <- map_data("state")

lat <- data.frame()
lon <- data.frame()
get the latitude and longitude of NYC from the datasciencetoolkit
for(i in 1:nrow(fltmean1)){

x <- geocode(as.character(fltmean1[i,1]),source="dsk")
lon[i,1] <- x[1]
lat[i,1] <- x[2]
}
head(lat)
head(lon)

latlon <- as.data.frame(cbind(lon,lat,fltmean1))

originCity <- ggplot(us, aes(x=long, y=lat)) + expand_limits(x = us$long, y = us$lat) 
originCity <- originCity + geom_polygon() + coord_map()
originCity <- originCity + geom_point(data=latlon, aes(x=lon, y=lat, size=mean1), color="orange")
