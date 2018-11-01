
library(ggplot2)
str(data)
departure_delay__plot<-ggplot(data,aes(x=data$Departure.Delay.in.Minutes,y=data$Satisfaction))+geom_count(color="red")
departure_delay__plot<-departure_delay__plot+labs(x="Departure Delay (minutes)",y="Customer Satisfaction")
departure_delay__plot
# Bubble plot for arrival delay and customer satisfaction.
arrival_delay__plot<-ggplot(data,aes(x=data$Arrival.Delay.in.Minutes,y=data$Satisfaction))+geom_count(color="blue")
arrival_delay__plot<-arrival_delay__plot+labs(x="Arrival Delay (minutes)",y="Customer Satisfaction")
arrival_delay__plot


# Bubble plot for flight time in minutes and customer satisfaction.
flight_time_plot<-ggplot(data,aes(x=data$Flight.time.in.minutes,y=data$Satisfaction))+geom_count()
flight_time_plot<-flight_time_plot+labs(x="Flight time (minutes)",y="Customer Satisfaction")
flight_time_plot


# Bubble plot for flight cancelled (Yes or No) with customer satisfaction.
flight_cancel_plot<-ggplot(data,aes(x=data$Flight.cancelled,y=data$Satisfaction))+geom_count()
flight_cancel_plot<-flight_cancel_plot+labs(x="Flight Cancellation",y="Customer Satisfaction")
flight_cancel_plot


# Bubble plot for class and customer satisfaction.
class_plot<-ggplot(data,aes(x=data$Class,y=data$Satisfaction))+geom_count()
class_plot<-class_plot+labs(x="Class",y="Customer Satisfaction")
class_plot


# Bubble plot for shopping amount at airport and customer satisfaction.
shopping_plot<-ggplot(data,aes(x=data$Shopping.Amount.at.Airport,y=data$Satisfaction))+geom_count()
shopping_plot<-shopping_plot+labs(x="Shopping Amount",y="Customer Satisfaction")
shopping_plot
