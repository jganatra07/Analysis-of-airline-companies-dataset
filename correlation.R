
library(lubridate)
library(ggplot2)
library(dplyr)
library(Hmisc)
library(corrplot)

####### bivariate correlation for all numerical independent variables #########
#If two of the independent variables are highly related, this leads to a problem called multicollinearity
str(data)
nu_data <- select(data, Satisfaction, Age,"Price.Sensitivity","No.of.Flights.p.a.","X..of.Flight.with.other.Airlines", "No..of.other.Loyalty.Cards", "Shopping.Amount.at.Airport", "Eating.and.Drinking.at.Airport","Scheduled.Departure.Hour","Departure.Delay.in.Minutes", "Arrival.Delay.in.Minutes", "Flight.time.in.minutes", "Flight.Distance")
str(nu_data)

#compute the correlation matrix
cor_1 <- round(cor(nu_data), 2)
cor_1

#the function cor() returns only the correlation coefficients between variables. 
# use Hmisc R package to calculate the correlation p-values.
cor_2 <- rcorr(as.matrix(nu_data))
cor_2

cor_m<-cor(nu_data)
head(round(cor_m,2))
corrplot(cor_m, type ="lower",order = "hclust", tl.col="black",tl.srt=45)

# output-- plot_cor_m
#from the correlation matrix, we can see that the below pairs of variables are 
#moderate and high correlation (r > .40)
# Flight.Distance vs Flight.time.in.minutes (.970)
# Arrival.Delay.in.Minutes  vs Departure.Delay.in.Minutes (.96)
#No..of.other.Loyalty.Cards vs X..of.Flight.with.other.Airlines (.43)
#No..of.other.Loyalty.Cards vs Price.Sensitivity (-.45) / age -.45



# significant difference in the mean of satisfaction by gender? --> yes
hist(data$Satisfaction)
bp_satisByGender <- ggplot(data, aes(Gender,Satisfaction))+geom_boxplot(aes(col=Gender))+labs(title="Boxplot of Satisfaction by Gender")
bp_satisByGender
t.test(data$Satisfaction ~ data$Gender)


# significant difference in the mean of satisfaction by flight cancelled? --> yes
hist(data$Satisfaction)
bp_satisByFCancelled <- ggplot(data, aes(Flight.cancelled,Satisfaction))+geom_boxplot(aes(col=Flight.cancelled))+labs(title="Boxplot of Satisfaction by Flight Cancellation")
bp_satisByFCancelled
t.test(data$Satisfaction ~ data$Flight.cancelled)

# significant difference in the mean of satisfaction by flight's arrival delay grater 5 mins ? --> yes
hist(data$Satisfaction)
bp_satisByGreater5 <- ggplot(data, aes(Arrival.Delay.greater.5.Mins,Satisfaction))+geom_boxplot(aes(col=Arrival.Delay.greater.5.Mins))+labs(title="Boxplot of Satisfaction by Arrival Delay")
bp_satisByGreater5
t.test(data$Satisfaction ~ data$Arrival.Delay.greater.5.Mins)

# significant difference in mean of satisfaction between class? --> yes
class_satis <- ggplot(data, aes(x = Class, fill = factor(Satisfaction))) +
  geom_bar() +
  xlab("Class") +
  ylab("Total Count") +
  labs(fill = "Satisfaction") 
class_satis

bp_satisByClass <- ggplot(data, aes(Class,Satisfaction))+geom_boxplot(aes(col=Class))+labs(title="Boxplot of Satisfaction by Class")
bp_satisByClass
#boxplot(data$Satisfaction~data$Class, data = data)
aov1<- aov(data$Satisfaction~data$Class)
summary(aov1)
TukeyHSD(aov1,conf.level=0.95)


# significant difference in mean of satisfaction among customers with different airline status? --> Platinum-Gold not sig
bp_satisByStatus <- ggplot(data, aes(Airline.Stauts,Satisfaction))+geom_boxplot(aes(col=Airline.Status))+labs(title="Boxplot of Satisfaction by Airline Status")
bp_satisByStatus
aov2<- aov(data$Satisfaction~data$Airline.Status)
summary(aov2)
TukeyHSD(aov2,conf.level=0.95)

# significant difference in mean of satisfaction among customers with type of travel?  --> yes
bp_satisByTravel <- ggplot(data, aes(Type.of.Travel,Satisfaction))+geom_boxplot(aes(col=Type.of.Travel))+labs(title="Boxplot of Satisfaction by Type of Travel")
bp_satisByTravel
aov3<- aov(data$Satisfaction~data$Type.of.Travel)
summary(aov3)
TukeyHSD(aov3,conf.level=0.95)

# model testing
model1 <- lm(Satisfaction ~ . -Flight.time.in.minutes -Departure.Delay.in.Minutes -X..of.Flight.with.other.Airlines, data = data)
summary(model1)

model2 <- lm(Satisfaction ~ . -Flight.time.in.minutes -Departure.Delay.in.Minutes -No..of.other.Loyalty.Cards -Flight.date -Day.of.Month -Airline.Code -Airline.Name -Year.of.First.Flight, data = data)
summary(model2)

model3 <- lm(Satisfaction ~ . -Flight.time.in.minutes -Flight.Distance -Arrival.Delay.in.Minutes -Departure.Delay.in.Minutes -No..of.other.Loyalty.Cards -Flight.date -Day.of.Month -Airline.Code -Airline.Name -Year.of.First.Flight -Eating.and.Drinking.at.Airport -Orgin.City -Origin.State -Destination.City -Destination.State, data = data)
summary(model3)

model4 <- lm(Satisfaction ~ . -Flight.time.in.minutes -Flight.Distance -Arrival.Delay.in.Minutes -Departure.Delay.in.Minutes -No..of.other.Loyalty.Cards -Flight.date -Day.of.Month -Airline.Code -Airline.Name -Year.of.First.Flight -Eating.and.Drinking.at.Airport -Orgin.City -Origin.State -Destination.City -Destination.State -X..of.Flight.with.other.Airlines, data = data)
summary(model4)

# ADJUSTED R-SUQRED 0.4077
