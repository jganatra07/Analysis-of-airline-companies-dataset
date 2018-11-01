
library(ggplot2)
#library(dplyr)
#satisfactioncount <- data %>% group_by(Orgin.City) %>% summarize(mean1 = mean(Satisfaction))
#satisfactioncount <- as.data.frame(satisfactioncount)
#plotting average satisfaction per gender vs customer satisfaction
#plot16 <- ggplot(satisfactioncount,aes(Orgin.City,mean1)) 
#plot16<- plot16 + geom_point()

data$Origin.City <- tolower(data$Orgin.City)
#turning data from the maps package into a data frame suitable for plotting with ggplot2
us <- map_data("state")
biplot3 <- ggplot(data, aes(map_id = data$Orgin.City))
#creating a map visualization
biplot3 <- biplot3 + geom_map(map = us, aes(fill = mean(data$Orgin.City)))
#defining the x and y axes values of the map
#coord_map() handles the distortion and aspect ratio of the map
biplot3 <- biplot3 + expand_limits(x = us$long, y = us$lat) + coord_map()
#ggtitle() gives a title to the map
biplot3 <- biplot3 + ggtitle("Map of color coded USA")
biplot3
