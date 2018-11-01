
library(ggplot2)

#flight date
summary(data$Flight.date)
flightdate <- ggplot(data=data, aes(x=Flight.date, y=Satisfaction)) +geom_bar(stat='identity')

#airline code
summary(data$Airline.Code)

counts <- table(data$Satisfaction, data$Airline.Code)     
barplot(counts, main="Satisfaction depending on Airline Code",
        col=c("darkblue","red", "yellow", "orange", "pink", "chartreuse", "brown1", "darkgoldenrod1", "burlywood3", "darkslategray2", "azure1", "bisque1", "blueviolet", "goldenrod4"), las=2,
        legend=rownames(counts), args.legend = list(x = "top", ncol=2, inset=c(0, 0), cex=.4))

#airline name
summary(data$Airline.Name)

counts2 <- table(data$Satisfaction, data$Airline.Name)     
barplot(counts2, main="Satisfaction depending on Airline Name",
        col=c("darkblue","red", "yellow", "orange", "pink", "chartreuse", "brown1", "darkgoldenrod1", "burlywood3", "darkslategray2", "azure1", "bisque1", "blueviolet", "goldenrod4"), las=2,
        legend=rownames(counts2), args.legend = list(x = "top", ncol=2, inset=c(0, 0), cex=.4))
#day of month vs. satisfaction
summary(data$Day.of.Month)
dayofmonth <- ggplot(data=data, aes(x=Day.of.Month, y=Satisfaction)) + geom_bar(stat='identity')
