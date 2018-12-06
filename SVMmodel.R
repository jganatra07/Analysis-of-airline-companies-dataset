
library(ggplot2)
library(lubridate)
library(dplyr)
library(jsonlite)
library(kernlab)
library(curl)

########################################################### 
#update new 2 columns
data$overallSatisfaction <-ifelse(data$Satisfaction>3,"Satisfied","Not Satisfied")
data$effectiveDelay <-abs(data$Departure.Delay.in.Minutes-data$Arrival.Delay.in.Minutes)
# show how many rows and columns
str(data)
dim(data) # [1] 129889     30

# made dummyData to cut down the size!!
Index<- sample(1:nrow(data), size = 129889, replace =FALSE)
dummyData<-data[Index,]
View(dummyData)
str(dummyData)

#show how many rows and columns
dim(data) # 129889 rows, 30 columns
# can use table() in factor

randIndex <- sample(1:dim(data)[1])
randIndex
# floor() chops off any decimal part of calculation
cutPoint2_3 <-floor(2*dim(data)[1]/3)
trainData <- data[1:cutPoint2_3,]
str(trainData)
summary(trainData)
testData <- data[randIndex[(cutPoint2_3+1):dim(data)[1]],]
testData
# Use the dim( ) function to demonstrate that the resulting training data set and test data set contain the appropriate number of cases.
dim(data)
dim(data)

##########################################################
#1) Build a support vector model using the ksvm( ) function
# include all most important 7 variables 3,4,5,7,9,13,28
#Age,Gender,Price.Sensitivity,No.of.Flights.p.a,Type.of.Travel,Class,Arrival.Delay.greater.5.Mins and overallSatisfaction

newtrainData <-trainData[,c(3,4,5,7,9,13,28,29)]
newtestData<-testData[,c(3,4,5,7,9,13,28,29)]
str(newtestData)
str(newtrainData)
ksvm(overallSatisfaction ~., data=newtrainData, kernel = "rbfdot",kpar="automatic", C=5,cross=3, prob.model=TRUE)

svmOutput1<-ksvm(overallSatisfaction ~ ., data=newtrainData, kernel = "rbfdot",kpar="automatic", C=5,cross=3, prob.model=TRUE)
svmOutput1

# See the output of Support vector histogram to understand outcome
hist(alpha(svmOutput1)[[1]], main="support vector histogram with C=5",
     xlab="support vector values")

svmPred <- predict(svmOutput1, newtestData, type = "votes")
svmPred
str(svmPred)
head(svmPred)

# Create a confusion matrix (a 2 x 2 table) 
comTable <- data.frame(newtestData[ ,8], svmPred[1, ])
table(comTable)

# Calculate an error rate based on what you see in the confusion matrix.
t<-table(comTable)
answer <- sum(t[1,1]+t[2,2])/sum(t)
# error rate : 0.2368755
