
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
cor <- corrplot(cor_m, type ="lower",order = "hclust", tl.col="black",tl.srt=45)
