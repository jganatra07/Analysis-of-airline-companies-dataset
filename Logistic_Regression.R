
library(jtools)
#install.packages('pscl')
library(pscl)
#install.packages("broom")
library(broom)
#install.packages("ggstance")
library(ggstance)
#install.packages("effects")
library(effects)
#install.packages("lattice")
#install.packages("caret")
library(caret)
#install.packages("e1071")
library(e1071)

str(data)
#Creating a single variable that can show the absolute value of the delay, instead of having two variable.
data$EffectiveDelay<-abs(data$Departure.Delay.in.Minutes-data$Arrival.Delay.in.Minutes)

#Removing the two variables
data$Departure.Delay.in.Minutes<-NULL
data$Arrival.Delay.in.Minutes<-NULL

#Converting the dependent variable into a categorical variable
data$Sat<-replicate(length(data$Satisfaction),0)
data$Sat[data$Satisfaction>3]<-1
data$Sat<-as.factor(data$Sat)
str(data)

#Removing the continuous version of the dependent variable
data<-data[,-c(1)]

#Removing few more variablle, that wouldn't play a significant role in determining the dependent variable
data$Airline.Code<-NULL
data$Airline.Name<-NULL
data$Orgin.City<-NULL
data$Origin.State<-NULL
data$Destination.City<-NULL
data$Destination.State<-NULL

#SPlitting the data into training and test data.
rand<-sample(1:dim(data)[1])
cutpoint2_3<-floor(2*dim(data)[1]/3)
cutpoint2_3

traindata<-data[rand[1:cutpoint2_3],]
testdata<-data[rand[(cutpoint2_3+1):dim(data)[1]],]

#Training the logistic regression model
model<-glm(Sat~., family=binomial(link="logit"),data=traindata)
summary(model)

#Removing insignificant variables from the train and test dataset
traindata$Day.of.Month<-NULL
traindata$Flight.date<-NULL
traindata$Flight.time.in.minutes<-NULL
traindata$Flight.Distance<-NULL
traindata$EffectiveDelay<-NULL
traindata$Eating.and.Drinking.at.Airport<-NULL


testdata$Day.of.Month<-NULL
testdata$Flight.date<-NULL
testdata$Flight.time.in.minutes<-NULL
testdata$Flight.Distance<-NULL
testdata$EffectiveDelay<-NULL
testdata$Eating.and.Drinking.at.Airport<-NULL


#K-Fold Cross Validation
ctrl <- trainControl(method = "repeatedcv", number = 10, savePredictions = TRUE)
mod_fit <- train(Sat ~.,  data=traindata, method="glm", family="binomial",
                 trControl = ctrl, tuneLength = 5)

#Predicting the dependent variable 
pred = predict(mod_fit, newdata=testdata)

#Confusion Matrix
cm<-table(confusionMatrix(data=pred, testdata$Sat))

