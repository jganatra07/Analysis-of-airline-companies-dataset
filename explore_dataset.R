
#library(lubridate)
library(ggplot2)
library(dplyr)

unclean_data$Satisfaction<-as.numeric(as.character(unclean_data$Satisfaction))
str(unclean_data)

#Spread of the three variables with missing variables
summary(unclean_data$Departure.Delay.in.Minutes)
summary(unclean_data$Arrival.Delay.in.Minutes)
summary(unclean_data$Flight.time.in.minutes)
summary(unclean_data$Satisfaction)

#Replacing the NA's
unclean_data$Departure.Delay.in.Minutes[is.na(unclean_data$Departure.Delay.in.Minutes)] <- mean(unclean_data$Departure.Delay.in.Minutes, na.rm=TRUE)
unclean_data$Arrival.Delay.in.Minutes[is.na(unclean_data$Arrival.Delay.in.Minutes)] <- mean(unclean_data$Arrival.Delay.in.Minutes, na.rm=TRUE)
unclean_data$Flight.time.in.minutes[is.na(unclean_data$Flight.time.in.minutes)] <- median(unclean_data$Flight.time.in.minutes, na.rm=TRUE)

#Replacing the NA's with the mean
unclean_data$Satisfaction[is.na(unclean_data$Satisfaction)] <- mean(unclean_data$Satisfaction, na.rm=TRUE)

#Summary after removing NA's 
summary(unclean_data$Departure.Delay.in.Minutes)
summary(unclean_data$Arrival.Delay.in.Minutes)
summary(unclean_data$Flight.time.in.minutes)
summary(unclean_data$Satisfaction)

#Dealing with the Flight Data variable
head(unclean_data$Flight.date)
#unclean_data$Flight.date<-mdy(unclean_data$Flight.date)

data<-unclean_data






