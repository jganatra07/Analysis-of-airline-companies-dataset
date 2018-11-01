

str(data)

library(ggplot2)


# make a scatter plot of independent variable : X..of.Flight.with.other.Airlines and dependent variable : Satisfaction 
perflightsat <- ggplot(data, aes(x=jitter(data$X..of.Flight.with.other.Airlines), y=Satisfaction, colour= "red"))+ geom_point()

# make a box plot of independent variable :Type.of.Travel and dependent variable : Satisfaction 
typetravelsat <- ggplot(data, aes(x=Type.of.Travel, y=Satisfaction, colour= "red")) + geom_boxplot(fill="grey")

# make a box plot of independent variable :No..of.other.Loyalty.Cards  and dependent variable : Satisfaction 
typetravelsat <- ggplot(data, aes(x=No..of.other.Loyalty.Cards, y=Satisfaction, colour= "red")) + geom_boxplot(fill="grey")
