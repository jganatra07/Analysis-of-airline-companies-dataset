
library(ggplot2)
library(dplyr)

str(unclean_data)
unclean_data$Satisfaction<-as.numeric(unclean_data$Satisfaction)
