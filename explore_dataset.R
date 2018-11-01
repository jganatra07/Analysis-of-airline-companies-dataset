
library("ggplot2")
library("lubridate")
library("dplyr")

unclean_data$Satisfaction<-as.numeric(as.character(unclean_data$Satisfaction) )
