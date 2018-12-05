
library(arules)
library(arulesViz)

newdata <- data[,1:13]
newdata <- newdata[,-2]
newdata <- newdata[,-4:-11]
