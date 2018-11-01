
library(ggplot2)
str(data)

#Hypothesis1 - Male and Female customers have significant differences in 
#satisfaction.
t.test(data$Satisfaction ~ data$Gender)
#  P-value < 2.2e-16 There is significant difference in satisfaction scores 
#between male and female passengers, so we will be including data$Gender in 
#the model.

#Hypothesis2 -Customers with different airline status have significant 
#differences in satisfaction.
model1<- aov(data$Satisfaction~data$Airline.Status)
summary(model1)

## sig difference
TukeyHSD(model1, conf.level = 0.99)
#There are four AilineStatus, six possible pair-wise comparisons are obtained.
#The results show that all the pairs of satisfaction are statistically 
#significantly different from the Tukey’s Honestly Significant Differences.

#Hypothesis3 -Customers with younger age and older age have significant 
#differences in satisfaction.
.....
summary(data$Age)

#more similar analyses will be conducted for the rest of the variables 



