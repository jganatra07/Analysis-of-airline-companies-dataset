
library(arules)
library(arulesViz)

newdata <- data[,1:13]
newdata <- newdata[,-2]
newdata <- newdata[,-4:-11]

#only focus on age, gender, and class (good predictors)
newdata$Satisfaction <- discretize(newdata$Satisfaction, methods = NULL, default = NULL)
newdata$Age <- discretize(newdata$Age, methods = NULL, default = NULL)

flightSurvey <- as(newdata, "transactions")

inspect(flightSurvey)

itemFrequency(flightSurvey)
freqplot <- itemFrequencyPlot(flightSurvey, support = 0.1, cex.names=0.5)

summary(flightSurvey)


apriori(flightSurvey, parameter = list(support = 0.005, confidence = 0.5))


#find what factors influence higher satisfaction rates
#shows men at the age between 37-53 had higher satisfaction (it was counted 14068 times)
ruleset <- apriori(data=flightSurvey, parameter = list(support = .01, confidence = 0.5), appearance = list(default="lhs", rhs="Satisfaction=[4,5]"))
rules_conf <- sort(ruleset, by="confidence", decreasing = TRUE)
inspect(head(rules_conf))

#THE HIGHER THE LIFT THE MORE INTERESTING

plot(ruleset)
inspect(ruleset)

#WANT HIGH SUPPORT AND HIGH CONFIDENCE

goodrules <- ruleset[quality(ruleset)$lift > 1.3]

plot(goodrules)
rules_lift <- sort(goodrules, by="lift", decreasing = TRUE)
inspect(head(rules_lift))
