
library(ggplot2)
str(data)


#Hypothesis - Male and Female passengers have significant differences in satisfaction.
#This line is for checking the distrubution of satisfaction to see if there is any outliers

plot1_hist <- hist(data$Satisfaction)

t.test(data$Satisfaction ~ data$Gender)
