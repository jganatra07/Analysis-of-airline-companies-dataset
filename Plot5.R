
library(ggplot2)
str(data)

# Bubble plot for departure delay and customer satisfaction.
departure_delay__plot<-ggplot(satisfactionSurvey,aes(x=satisfactionSurvey$Departure.Delay.in.Minutes,y=satisfactionSurvey$Satisfaction))+geom_count()
departure_delay__plot<-departure_delay__plot+labs(x="Departure Delay (minutes)",y="Customer Satisfaction")+xlim(0,600)
departure_delay__plot 


# Bubble plot for arrival delay and customer satisfaction.
arrival_delay__plot<-ggplot(satisfactionSurvey,aes(x=satisfactionSurvey$Arrival.Delay.in.Minutes,y=satisfactionSurvey$Satisfaction))+geom_count()
arrival_delay__plot<-arrival_delay__plot+labs(x="Arrival Delay (minutes)",y="Customer Satisfaction")+xlim(0,800)
arrival_delay__plot


# Bubble plot for flight time in minutes and customer satisfaction.
flight_time_plot<-ggplot(satisfactionSurvey,aes(y=satisfactionSurvey$Flight.time.in.minutes,x=satisfactionSurvey$Satisfaction))+geom_jitter(color="blue")
flight_time_plot<-flight_time_plot+labs(y="Flight time (minutes)",x="Customer Satisfaction")+ylim(0,450)
flight_time_plot


# Bubble plot for flight cancelled (Yes or No) with customer satisfaction.
flight_cancel_plot<-ggplot(satisfactionSurvey,aes(x=satisfactionSurvey$Flight.cancelled,y=satisfactionSurvey$Satisfaction))+geom_jitter(color="green")
flight_cancel_plot<-flight_cancel_plot+labs(x="Flight Cancellation",y="Customer Satisfaction")
flight_cancel_plot

# Bubble plot for class and customer satisfaction.
class_plot<-ggplot(satisfactionSurvey,aes(x=satisfactionSurvey$Class,y=satisfactionSurvey$Satisfaction))+geom_jitter(color="purple")
class_plot<-class_plot+labs(x="Class",y="Customer Satisfaction")
class_plot


# Bubble plot for shopping amount at airport and customer satisfaction.
shopping_plot<-ggplot(satisfactionSurvey,aes(x=satisfactionSurvey$Shopping.Amount.at.Airport,y=satisfactionSurvey$Satisfaction))+geom_jitter()
shopping_plot<-shopping_plot+labs(x="Shopping Amount",y="Customer Satisfaction")
shopping_plot
