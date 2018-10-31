
library(jsonlite)
library(ggplot2)

#
flight_cancel_plot<-ggplot(satisfactionSurvey)+geom_bar(stat = "identity",aes(x=satisfactionSurvey$Flight.cancelled,y=satisfactionSurvey$Satisfaction),width = 0.4)
flight_cancel_plot<-flight_cancel_plot+labs(x="Flight Cancellation",y="Customer Satisfaction")
flight_cancel_plot
