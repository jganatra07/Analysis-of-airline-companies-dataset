
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

#Creating a single variable that can show the absolute value of the delay, instead of having two variable.
unclean_data$EffectiveDelay<-abs(unclean_data$Departure.Delay.in.Minutes-unclean_data$Arrival.Delay.in.Minutes)

#Removing the two variables
unclean_data$Departure.Delay.in.Minutes<-NULL
unclean_data$Arrival.Delay.in.Minutes<-NULL

