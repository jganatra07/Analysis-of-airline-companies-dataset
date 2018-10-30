
library(ggplot2)
library(dplyr)

unclean_data$Satisfaction<-as.numeric(unclean_data$Satisfaction)
str(unclean_data)

#Spread of the three variables with missing variables
summary(unclean_data$Departure.Delay.in.Minutes)
summary(unclean_data$Arrival.Delay.in.Minutes)
summary(unclean_data$Flight.time.in.minutes)

#Replacing the NA's
unclean_data$Departure.Delay.in.Minutes[is.na(unclean_data$Departure.Delay.in.Minutes)] <- mean(unclean_data$Departure.Delay.in.Minutes, na.rm=TRUE)
unclean_data$Arrival.Delay.in.Minutes[is.na(unclean_data$Departure.Delay.in.Minutes)] <- mean(unclean_data$Arrival.Delay.in.Minutes, na.rm=TRUE)
unclean_data$Arrival.Delay.in.Minutes[is.na(unclean_data$Flight.time.in.minutes)] <- median(unclean_data$Flight.time.in.minutes, na.rm=TRUE)

#Summary after removing NA's 
