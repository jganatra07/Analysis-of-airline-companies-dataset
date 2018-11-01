
library(ggplot2)
str(data)


#Hypothesis - Male and Female passengers have significant differences in satisfaction.
t.test(data$Satisfaction ~ data$Gender)
