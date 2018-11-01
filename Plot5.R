
library(ggplot2)
str(data)
departure_delay__plot<-ggplot(data,aes(x=data$Departure.Delay.in.Minutes,y=data$Satisfaction))+geom_count(color="red")
departure_delay__plot<-departure_delay__plot+labs(x="Departure Delay (minutes)",y="Customer Satisfaction")
departure_delay__plot
