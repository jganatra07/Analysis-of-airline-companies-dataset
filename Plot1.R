
str(data)
#Plot of Age v Satisfaction
library(ggplot2)
library(dplyr)
#plot(data$Age, data$Satisfaction)

data$Satisfaction<-tolower(data$Satisfaction)

#Plot of Age vs Avg. Satisfaction
satmean <- data %>%
  group_by(Satisfaction) %>%
  summarize(m1 = mean(Age))

agemean<-as.data.frame(satmean)
print("structure of agemean")
str(agemean)
agesat<-ggplot(agemean,aes(Satisfaction,m1)) + geom_bar(stat="identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1))

#Plotting Satisfaction against the Flight Date
data$Flight.date <- as.factor(data$Flight.date)
data$Satisfaction <- as.numeric(data$Satisfaction)
flightdate <- data %>%
  group_by(Flight.date) %>%
  summarize(m2 = mean(Satisfaction))
  
print("structure of flightdate")
str(flightdate)
flightdate<-as.data.frame(flightdate)flightdate$Satisfaction <- as.numeric(flightdate$Satisfaction)
str(flightdate)
print("structure of flightdate1")
flight_date<-ggplot(flightdate, aes(Flight.date,m2, group=1))+geom_line()+labs(x="From 1st Jan to 31st March 2014", y="Mean Satisfaction")


#Plotting Airline Status against Satisfaction
air_status<-ggplot(data, aes(Airline.Status, Satisfaction))+geom_boxplot()+labs(x="Airline Status", y="Satisfaction")

#Plotting Gender against Satisfaction
data1 <- data
data1$genderFactor <- as.factor(data1$Gender)
gender_sat<-ggplot(data1, aes(GenderFactor, Satisfaction))+geom_boxplot()+labs(x="Gender", y="Satisfaction")
