

str(data)

library(ggplot2)


# make scatter plot of independent variable : X..of.Flight.with.other.Airlines and dependent variable : Satisfaction 
perflightsat <- ggplot(data, aes(x=jitter(data$X..of.Flight.with.other.Airlines), y=Satisfaction, colour= "red"))+ geom_point()

# make scatter plot of independent variable : X..of.Flight.with.other.Airlines and dependent variable : Satisfaction 
typetravelsat <- ggplot(data, aes(x=jitter(data$Type.of.Travel ), y=Satisfaction, colour= "red")) + geom_boxplot(fill="grey")
