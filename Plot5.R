
library(ggplot2)
str(data)
departure_delay__plot<-ggplot(data,aes(x=data$Departure.Delay.in.Minutes,y=data$Satisfaction))+geom_count(color="red")
departure_delay__plot<-departure_delay__plot+labs(x="Departure Delay (minutes)",y="Customer Satisfaction")
departure_delay__plot
# Bubble plot for arrival delay and customer satisfaction.
arrival_delay__plot<-ggplot(satisfactionSurvey,aes(x=satisfactionSurvey$Arrival.Delay.in.Minutes,y=satisfactionSurvey$Satisfaction))+geom_count(color="blue")
arrival_delay__plot<-arrival_delay__plot+labs(x="Arrival Delay (minutes)",y="Customer Satisfaction")
arrival_delay__plot


# Bubble plot for flight time in minutes and customer satisfaction.
flight_time_plot<-ggplot(satisfactionSurvey,aes(x=satisfactionSurvey$Flight.time.in.minutes,y=satisfactionSurvey$Satisfaction))+geom_count()
flight_time_plot<-flight_time_plot+labs(x="Flight time (minutes)",y="Customer Satisfaction")
flight_time_plot


# Bubble plot for flight cancelled (Yes or No) with customer satisfaction.
flight_cancel_plot<-ggplot(satisfactionSurvey,aes(x=satisfactionSurvey$Flight.cancelled,y=satisfactionSurvey$Satisfaction))+geom_count()
flight_cancel_plot<-flight_cancel_plot+labs(x="Flight Cancellation",y="Customer Satisfaction")
flight_cancel_plot


# Bubble plot for class and customer satisfaction.
class_plot<-ggplot(satisfactionSurvey,aes(x=satisfactionSurvey$Class,y=satisfactionSurvey$Satisfaction))+geom_count()
class_plot<-class_plot+labs(x="Class",y="Customer Satisfaction")
class_plot


# Bubble plot for shopping amount at airport and customer satisfaction.
shopping_plot<-ggplot(satisfactionSurvey,aes(x=satisfactionSurvey$Shopping.Amount.at.Airport,y=satisfactionSurvey$Satisfaction))+geom_count()
shopping_plot<-shopping_plot+labs(x="Shopping Amount",y="Customer Satisfaction")
shopping_plot
