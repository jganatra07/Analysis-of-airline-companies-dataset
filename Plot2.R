
str(data)
library(ggplot2)

# exploring the 5 variables by using specific plots that fit in the each variable

# make a scatter plot of independent variable : X..of.Flight.with.other.Airlines and dependent variable : Satisfaction 
perflightsat <- ggplot(unclean_data, aes(x = X..of.Flight.with.other.Airlines, fill = factor(Satisfaction))) +
  geom_bar() +
  xlab("X..of.Flight.with.other.Airlines") +
  ylab("Total Count") +
  labs(fill = "Satisfaction") 
perflightsat

# make a box plot of independent variable :Type.of.Travel and dependent variable : Satisfaction 
typetravelsat <- ggplot(data, aes(x=Type.of.Travel, y=Satisfaction, colour= "red")) + geom_boxplot(fill="grey")

# make a scatter plot of independent variable :No..of.other.Loyalty.Cards  and dependent variable : Satisfaction 
## No. Of other Loyalty Cards – it is kind of membership card of each customer, that for retail establishment to gain a benefits such as, discounts.  
loyalcardsat1 <- ggplot(data=data, aes(x=No..of.other.Loyalty.Cards, y=Satisfaction)) +geom_bar(stat='identity')

# make a scatter plot of independent variable :Shopping.Amount.at.Airport and dependent variable : Satisfaction 
shoppingamtsat <- ggplot(data, aes(x=Shopping.Amount.at.Airport , y=Satisfaction, colour= "red")) +  geom_point()

# make a scatter plot of independent variable :Eating.and.Drinking.at.Airport and dependent variable : Satisfaction 
eatdrinksat1<-ggplot(data, aes(x=data$Eating.and.Drinking.at.Airport,y=data$Satisfaction))+geom_count()
eatdrinksat1<-eatdrinksat1+labs(x="Eating.and.Drinking.at.Airport",y="Customer Satisfaction")
eatdrinksat1
