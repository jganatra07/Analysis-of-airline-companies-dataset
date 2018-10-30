
library(ggplot2)
library(dplyr)

unclean_data$Satisfaction<-as.numeric(unclean_data$Satisfaction)
str(unclean_data)

#Spread of the three variables with missing variables
summary(unclean_data$Departure.Delay.in.Minutes)
summary(unclean_data$Arrival.Delay.in.Minutes)
summary(unclean_data$Flight.time.in.minutes)
