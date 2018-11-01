
library(ggplots)
str(data)


#Hypothesis - Male and Female passengers have significant differences in satisfaction.
hist(data$Satisfaction)
bp_satisByGender <- ggplot(data, aes(Gender,Satisfaction))+geom_boxplot(aes(col=Gender))+labs(title="Boxplot of Satisfaction by Gender")
bp_satisByGender
