
str(data)
#Plot of Age v Satisfaction
library(ggplot2)
library(dplyr)
#plot(data$Age, data$Satisfaction)


#Plot of Age vs Avg. Satisfaction
satmean <- data %>%
  group_by(Satisfaction) %>%
  summarize(m1 = mean(Age))

agemean<-as.data.frame(satmean)

agesat<-ggplot(agemean,aes(Satisfaction,m1)) + geom_bar(stat="identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1)+labs(x="Satisfaction", y="Average Age"))

#Plotting Satisfaction against the Flight Date
flightdate <- data %>%
  group_by(Flight.date) %>%
  summarize(m2 = mean(Satisfaction))

flightdate<-as.data.frame(flightdate)

flight_date<-ggplot(flightdate, aes(Flight.date,m2, group=1))+geom_line()+labs(x="From 1st Jan to 31st March 2014", y="Mean Satisfaction")


#Plotting Airline Status against Satisfaction
air_status<-ggplot(data, aes(Airline.Status, Satisfaction))+geom_boxplot()+labs(x="Airline Status", y="Satisfaction")

#Plotting Gender against Satisfaction
gender_sat<-ggplot(data, aes(Gender, Satisfaction))+geom_boxplot()+labs(x="Gender", y="Satisfaction")
