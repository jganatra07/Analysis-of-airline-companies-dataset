
library(jtools)
#install.packages('pscl')
library(pscl)
#install.packages("broom")
library(broom)
#install.packages("ggstance")
library(ggstance)
#install.packages("effects")
library(effects)
#install.packages("lattice")
#install.packages("caret")
library(caret)
#install.packages("e1071")
library(e1071)

str(data)
#Creating a single variable that can show the absolute value of the delay, instead of having two variable.
data$EffectiveDelay<-abs(data$Departure.Delay.in.Minutes-data$Arrival.Delay.in.Minutes)

#Removing the two variables
data$Departure.Delay.in.Minutes<-NULL
data$Arrival.Delay.in.Minutes<-NULL

#Converting the dependent variable into a categorical variable
data$Sat<-replicate(length(data$Satisfaction),0)
data$Sat[data$Satisfaction>3]<-1
data$Sat<-as.factor(data$Sat)
str(data)

#Removing the continuous version of the dependent variable
data<-data[,-c(1)]

data$Airline.Code<-NULL
data$Airline.Name<-NULL
data$Orgin.City<-NULL
data$Origin.State<-NULL
data$Destination.City<-NULL
data$Destination.State<-NULL

