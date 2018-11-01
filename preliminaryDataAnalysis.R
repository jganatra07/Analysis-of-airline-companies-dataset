
library(ggplot2)
str(data)


#Hypothesis - Male and Female customers have significant differences in 
#satisfaction.
t.test(data$Satisfaction ~ data$Gender)
#  P-value < 2.2e-16 There is significant difference in satisfaction scores 
#between male and female passengers, so we will be including data$Gender in the model.

#Hypothesis -Customers with different airline status have significant differences in 
#satisfaction.
model1<- aov(data$Satisfaction~data$Airline.Status)
summary(model1)

