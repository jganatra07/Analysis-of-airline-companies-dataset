
library(ggthemes)
library(ggplot2)
library(extrafonts)
library(plyr)
library(scales)

#day of month vs. satisfaction
summary(data$Day.of.Month)
dayofmonth <- ggplot(data=data, aes(x=Day.of.Month, y=Satisfaction)) + geom_bar(stat='identity')
dayofmonth

#airline code
summary(data$Airline.Code)

counts <- table(data$Satisfaction, data$Airline.Code) 

airlinecodesat <- barplot(counts, main="Satisfaction depending on Airline Code", col=c("darkblue","red", "yellow", "orange", "pink", "chartreuse", "brown1", "darkgoldenrod1", "burlywood3", "darkslategray2", "azure1", "bisque1", "blueviolet", "goldenrod4"), las=2, legend=rownames(counts), args.legend = list(x = "top", ncol=2, inset=c(0, 0), cex=.4))
airlinecodesat

#airline name
summary(data$Airline.Name)

counts2 <- table(data$Satisfaction, data$Airline.Name)

airlinenamesat <- barplot(counts2, main="Satisfaction depending on Airline Name", col=c("darkblue","red", "yellow", "orange", "pink", "chartreuse", "brown1", "darkgoldenrod1", "burlywood3", "darkslategray2", "azure1", "bisque1", "blueviolet", "goldenrod4"), las=2, legend=rownames(counts2), args.legend = list(x = "top", ncol=2, inset=c(0, 0), cex=.4))
airlinenamesat
