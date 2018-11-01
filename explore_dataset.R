
library("ggplot2")
library("lubridate")
library("dplyr")

head(unclean_data)

unclean_data$Satisfaction<-as.numeric(as.character(unclean_data$Satisfaction) )
