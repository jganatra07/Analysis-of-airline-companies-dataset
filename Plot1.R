
str(data)
#Plot of Age v Satisfaction
library(ggplot2)
library(dplyr)
#plot(data$Age, data$Satisfaction)

data$Satisfaction<-tolower(data$Satisfaction)
is.na(data$Satisfaction)

#Plot of Age vs Avg. Satisfaction
agemean <- data %>%
  group_by(Age) %>%
  summarize(m1 = mean(Satisfaction))

agemean<-as.data.frame(agemean)

agesat<-ggplot(agemean,aes(Age,m1)) + geom_bar(stat="identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1))

#Mean age for each Satisfaction score

#satmean <- data %>%
#  group_by(Satisfaction) %>%
#  summarize(m1 = mean(Age))

#agemean<-as.data.frame(satmean)

#ggplot(satmean,aes(Satisfaction,m1)) + geom_bar(stat="identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1))
