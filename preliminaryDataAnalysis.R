
library(ggplot2)
str(data)


#Hypothesis - Male and Female passengers have significant differences in 
#satisfaction.
t.test(data$Satisfaction ~ data$Gender)
#  P-value < 2.2e-16 There is significant difference in satisfaction scores 
#between male and female passengers, so we will be including data$Gender in the model.

#Hypothesis - Male and Female passengers have significant differences in 
#satisfaction.
t.test(data$Satisfaction ~ data$Gender)
