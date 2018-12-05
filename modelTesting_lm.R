
library(ggplot2)
library(dplyr)
library(Hmisc)
library(corrplot)
library(ggcorrplot)

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
corPlot<- ggcorrplot(cor_m)

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
bp_satisByStatus <- ggplot(data, aes(Airline.Status,Satisfaction))+geom_boxplot(aes(col=Airline.Status))+labs(title="Boxplot of Satisfaction by Airline Status")
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

# ADJUSTED R-SUQRED 0.4069 with 11 predictors

model5 <- lm(Satisfaction ~ . -Shopping.Amount.at.Airport -Flight.time.in.minutes -Flight.Distance -Arrival.Delay.in.Minutes -Departure.Delay.in.Minutes -No..of.other.Loyalty.Cards -Flight.date -Day.of.Month -Airline.Code -Airline.Name -Year.of.First.Flight -Eating.and.Drinking.at.Airport -Orgin.City -Origin.State -Destination.City -Destination.State -X..of.Flight.with.other.Airlines, data = data)
summary(model5)
# ADJUSTED R-SUQRED 0.4069 with 10 predictors

model6 <- lm(Satisfaction ~ . -Flight.cancelled -Shopping.Amount.at.Airport -Flight.time.in.minutes -Flight.Distance -Arrival.Delay.in.Minutes -Departure.Delay.in.Minutes -No..of.other.Loyalty.Cards -Flight.date -Day.of.Month -Airline.Code -Airline.Name -Year.of.First.Flight -Eating.and.Drinking.at.Airport -Orgin.City -Origin.State -Destination.City -Destination.State -X..of.Flight.with.other.Airlines, data = data)
summary(model6)
# ADJUSTED R-SUQRED 0.4063 with 9 predictors

model7 <- lm(Satisfaction ~ . -Price.Sensitivity -Flight.cancelled -Shopping.Amount.at.Airport -Flight.time.in.minutes -Flight.Distance -Arrival.Delay.in.Minutes -Departure.Delay.in.Minutes -No..of.other.Loyalty.Cards -Flight.date -Day.of.Month -Airline.Code -Airline.Name -Year.of.First.Flight -Eating.and.Drinking.at.Airport -Orgin.City -Origin.State -Destination.City -Destination.State -X..of.Flight.with.other.Airlines, data = data)
summary(model7)
# ADJUSTED R-SUQRED 0.4057 with 8 predictors


model8 <- lm(Satisfaction ~ .-Arrival.Delay.greater.5.Mins -Price.Sensitivity -Flight.cancelled -Shopping.Amount.at.Airport -Flight.time.in.minutes -Flight.Distance -Arrival.Delay.in.Minutes -Departure.Delay.in.Minutes -No..of.other.Loyalty.Cards -Flight.date -Day.of.Month -Airline.Code -Airline.Name -Year.of.First.Flight -Eating.and.Drinking.at.Airport -Orgin.City -Origin.State -Destination.City -Destination.State -X..of.Flight.with.other.Airlines, data = data)
summary(model8)
# ADJUSTED R-SUQRED 0.4057 --> 38.79 with 7 predictors, so I decided to keep arrival delay greater 5 mins

model9 <- lm(Satisfaction ~ .-Scheduled.Departure.Hour -Price.Sensitivity -Flight.cancelled -Shopping.Amount.at.Airport -Flight.time.in.minutes -Flight.Distance -Arrival.Delay.in.Minutes -Departure.Delay.in.Minutes -No..of.other.Loyalty.Cards -Flight.date -Day.of.Month -Airline.Code -Airline.Name -Year.of.First.Flight -Eating.and.Drinking.at.Airport -Orgin.City -Origin.State -Destination.City -Destination.State -X..of.Flight.with.other.Airlines, data = data)
summary(model9)

# ADJUSTED R-SUQRED 0.4057 -->40.54 with 7 predictors

model10 <- lm(Satisfaction ~ .-No.of.Flights.p.a. -Scheduled.Departure.Hour -Price.Sensitivity -Flight.cancelled -Shopping.Amount.at.Airport -Flight.time.in.minutes -Flight.Distance -Arrival.Delay.in.Minutes -Departure.Delay.in.Minutes -No..of.other.Loyalty.Cards -Flight.date -Day.of.Month -Airline.Code -Airline.Name -Year.of.First.Flight -Eating.and.Drinking.at.Airport -Orgin.City -Origin.State -Destination.City -Destination.State -X..of.Flight.with.other.Airlines, data = data)
summary(model10)

# ADJUSTED R-SUQRED 0.4054 --->40.29 with 6 predictors

model11 <- lm(Satisfaction ~ .-Class -No.of.Flights.p.a. -Scheduled.Departure.Hour -Price.Sensitivity -Flight.cancelled -Shopping.Amount.at.Airport -Flight.time.in.minutes -Flight.Distance -Arrival.Delay.in.Minutes -Departure.Delay.in.Minutes -No..of.other.Loyalty.Cards -Flight.date -Day.of.Month -Airline.Code -Airline.Name -Year.of.First.Flight -Eating.and.Drinking.at.Airport -Orgin.City -Origin.State -Destination.City -Destination.State -X..of.Flight.with.other.Airlines, data = data)
summary(model11)

# ADJUSTED R-SUQRED 0.4029 --> 40.23 with 5 predictors

model12 <- lm(Satisfaction ~ .-Age -Class -No.of.Flights.p.a. -Scheduled.Departure.Hour -Price.Sensitivity -Flight.cancelled -Shopping.Amount.at.Airport -Flight.time.in.minutes -Flight.Distance -Arrival.Delay.in.Minutes -Departure.Delay.in.Minutes -No..of.other.Loyalty.Cards -Flight.date -Day.of.Month -Airline.Code -Airline.Name -Year.of.First.Flight -Eating.and.Drinking.at.Airport -Orgin.City -Origin.State -Destination.City -Destination.State -X..of.Flight.with.other.Airlines, data = data)
summary(model12)

# ADJUSTED R-SUQRED 0.4057 -->40.54  7  --->40.29 6  --- 40.23 5 -- 40.13 4

model13 <- lm(Satisfaction ~ .-Gender -Age -Class -No.of.Flights.p.a. -Scheduled.Departure.Hour -Price.Sensitivity -Flight.cancelled -Shopping.Amount.at.Airport -Flight.time.in.minutes -Flight.Distance -Arrival.Delay.in.Minutes -Departure.Delay.in.Minutes -No..of.other.Loyalty.Cards -Flight.date -Day.of.Month -Airline.Code -Airline.Name -Year.of.First.Flight -Eating.and.Drinking.at.Airport -Orgin.City -Origin.State -Destination.City -Destination.State -X..of.Flight.with.other.Airlines, data = data)
summary(model13)
# ADJUSTED R-SUQRED 0.4057 -->40.54  7  --->40.29 6  --- 40.23 5 -- 40.13 4  --- 39.46 3 

m <- lm(formula = Satisfaction ~ Airline.Status + Type.of.Travel, data = data)
summary(m)
# ADJUSTED R-SUQRED 37.73

m2 <- lm(formula = Satisfaction ~ Airline.Status + Type.of.Travel + Arrival.Delay.greater.5.Mins, data = data)
summary(m2)
# ADJUSTED R-SUQRED 39.46

m3 <- lm(formula = Satisfaction ~ Airline.Status + Type.of.Travel + Arrival.Delay.greater.5.Mins, data = data)
summary(m3)
# ADJUSTED R-SUQRED for final model was 39.46 


