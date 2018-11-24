
# update new 2 columns
data$overallSatisfaction <-ifelse(data$Satisfaction>3,"Satisfied","Not Satisfied")
data$effectiveDelay <-abs(data$Departure.Delay.in.Minutes-data$Arrival.Delay.in.Minutes)

#show how many rows and columns
str(data)
dim(data) # [1] 129889     30

# made dummyData to cut down the size!!
dummyData<- sample(data, size=100000, replace =TRUE)
dummyData

# floor() chops off any decimal part of calculation
cutPoint2_3 <-floor(2*dim(dummyData)[1]/3)
trainData <- dummyData[1:cutPoint2_3,]
str(trainData)
summary(trainData)
testData <- dummyData[randIndex[(cutPoint2_3+1):dim(dummyData)[1]],]
# Use the dim( ) function to demonstrate that the resulting training data set and test data set contain the appropriate number of cases.
dim(trainData)
dim(testData)
# Build a support vector model using the ksvm( ) function

svmOutput1<-ksvm(overallSatisfaction ~ Age+Gender+Class, data=trainData, kernel = "rbfdot",kpar="automatic", C=5,cross=3, prob.model=TRUE)
svmOutput1


  
  
