
library(ggplot2)

summary(data$Day.of.Month)
monthBucket <- replicate(length(data$Day.of.Month), "Middle")
#if values are above 21, will return end of month
monthBucket[data$Day.of.Month > 21] <- "End"
#if values are below 10, will return beginning of month
monthBucket[data$Day.of.Month < 10] <- "Beginning"

table(monthBucket)
#most of the people travel during the middle of the month
#Beginning    End    Middle 
# 37566      39409     52914 

monthBucket <- sapply(monthBucket, as.factor)

summary(data$Satisfaction)
satisfactionBucket <- replicate(length(data$Satisfaction), "Average")
satisfactionBucket[data$Satisfaction > 4] <- "High"
satisfactionBucket[data$Satisfaction < 4] <- "Low"
table(satisfactionBucket)
#Average    High     Low 
# 53758   12554   63577 

satisfactionBucket<- sapply(satisfactionBucket,as.factor)


table(satisfactionBucket, monthBucket)
#                   monthBucket
#satisfactionBucket    Middle   End    Beginning
#           Average     22204   16512     15042
#              High      5089    3804      3661
#               Low      25621   19093     18863

#52914 people travelled in middle of the month
#39409 people travelled at end of month
#37566 people travelled at beginning of month

prop.table(table(satisfactionBucket, monthBucket))
#                     monthBucket
#satisfactionBucket     Middle        End        Beginning
#           Average   0.17094596   0.12712393    0.11580657
#              High    0.03917961  0.02928654    0.02818560
#               Low    0.19725304  0.14699474    0.14522400

#do not use below
#ggplot(data= data, aes(x=monthBucket, y=satisfactionBucket)) + geom_bar(stat='identity')

#stacked bar graph:
counts3 <- table(satisfactionBucket, monthBucket)
monthBucketPlot <- barplot(counts3, main="Satisfaction depending Day of Month",
        col=c("darkblue","red", "yellow"),
        legend=rownames(counts3), args.legend = list(x = "topright", ncol=2, inset=c(0, 0), cex=.4))

