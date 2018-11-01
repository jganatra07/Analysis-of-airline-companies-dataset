
library(ggplot2)
library(dplyr)
satisfactioncount <- data %>% group_by(Orgin.City) %>% summarize(mean1 = mean(satisfaction))
satisfactioncount <- as.data.frame(satisfactioncount)
#plotting average satisfaction per gender vs customer satisfaction
plot16 <- ggplot(satisfactioncount,aes(Orgin.City,mean1)) 
plot16<- plot16 + geom_point()
