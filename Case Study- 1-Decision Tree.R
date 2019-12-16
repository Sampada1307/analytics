#Decision Tress
library(rpart)
library(rpart.plot)
library(gsheet)
url='https://raw.githubusercontent.com/DUanalytics/datasets/master/csv/DTbills.csv'
DTbills<-read.csv(url)
str(DTbills)
summary(DTbills)
dim(DTbills)
names(DTbills)
head(DTbills)
attributes(DTbills)

library(gsheet)

#Clean the dataset----
#The structure of the data shows some variables have NA's. Data clean up to be done as follows
#Replace "?" with "NA" in the dataset:
View(DTbills)

library(dplyr)

#Create train/test set----
trainDataIndex <- sample(1:nrow(DTbills),0.8*nrow(DTbills), replace = F)
trainData <-DTbills[trainDataIndex, ]
testData <-DTbills[-trainDataIndex, ]
View(trainData)
View(testData)

#We can use the function prop.table() combined with table() to verify if the randomization process 
#is correct.
prop.table(table(trainData$std))
prop.table(table(testData$std))
prop.table(table(trainData$Leave.service))
prop.table(table(testData$Leave.service))
prop.table(table(trainData$Bill))
prop.table(table(testData$Bill))
#In both dataset, the amount of survivors is the same, about 40 percent, hence, randomization process 
#while dividing the dataset into test & train has been done correctly.

#Build the model----
#install.packages("rpart")
#install.packages("rpart.plot")
library(rpart)
library(rpart.plot)

fit <- rpart(std~., data = trainData, method = 'class')
rpart.plot(fit)

fit <- rpart(Leave.service~., data = trainData, method = 'class')
rpart.plot(fit)

fit <- rpart(Bill~., data = trainData, method = 'class')
rpart.plot(fit)


#Prediction:
# Using the decision tree model build above on the test dataset, 
#we will predict which passengers are more likely to survive after the collision.
testData$predict_unseen <-predict(fit, testData, type = 'class')
View(testData)

