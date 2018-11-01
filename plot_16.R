
data$Orgin.City <- tolower(data$Orgin.City)
us <- map_data("state")
plot16 <- ggplot(data, aes(map_id = Orgin.City))
#creating a map visualization
plot16 <- plot16 + geom_map(map = us, aes(fill = factor(data$Satisfaction)))
#defining the x and y axes values of the map
#coord_map() handles the distortion and aspect ratio of the map
plot16 <- plot16 + expand_limits(x = us$long, y = us$lat) + coord_map()
#ggtitle() gives a title to the map
biplot3
