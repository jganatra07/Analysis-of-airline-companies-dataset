
#day of month vs. satisfaction
summary(unclean_data$Day.of.Month)
dayofmonth <- ggplot(data=unclean_data, aes(x=Day.of.Month, y=Satisfaction)) + geom_bar(stat='identity')
