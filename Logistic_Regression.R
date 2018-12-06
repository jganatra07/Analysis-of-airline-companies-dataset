
library(jtools)
#install.packages('pscl')
library(pscl)
#install.packages("broom")
library(broom)
#install.packages("ggstance")
library(ggstance)
#install.packages("effects")
#library(effects)
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
data$Day.of.Month<-NULL
data$Flight.date<-NULL
data$Flight.time.in.minutes<-NULL
data$Flight.Distance<-NULL
data$EffectiveDelay<-NULL
data$Eating.and.Drinking.at.Airport<-NULL
data$X..of.Flight.with.other.Airlines<-NULL
data$Shopping.Amount.at.Airport <-NULL


#SPlitting the data into training and test data.
rand<-sample(1:dim(data)[1])
cutpoint2_3<-floor(2*dim(data)[1]/3)
cutpoint2_3

traindata<-data[rand[1:cutpoint2_3],]
testdata<-data[rand[(cutpoint2_3+1):dim(data)[1]],]

#Training the logistic regression model
model<-glm(Sat~., family=binomial(link="logit"),data=traindata)
summary(model)

#K-Fold Cross Validation
ctrl <- trainControl(method = "repeatedcv", number = 10, savePredictions = TRUE)
mod_fit <- train(Sat ~.,  data=traindata, method="glm", family="binomial",
                 trControl = ctrl, tuneLength = 5)

#Predicting the dependent variable 
pred = predict(mod_fit, newdata=testdata)

#Confusion Matrix
confusionMatrix(data=pred, testdata$Sat)

"Unlike linear regression with ordinary least squares estimation, there is no R2 statistic which explains 
the proportion of variance in the dependent variable that is explained by the predictors. 
However, there are a number of pseudo R2 metrics that could be of value. 
Most notable is McFadden’s R2, which is defined as 1−[ln(LM)/ln(L0)] where ln(LM) is the log likelihood value 
for the fitted model and ln(L0) is the log likelihood for the null model with only an intercept as a predictor. 
The measure ranges from 0 to just under 1, with values closer to zero indicating that the model has no predictive power."
pR2(model2)

