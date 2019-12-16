#Case Study - Decision Tree - Body Fat
#Prediction of Body Fat by Skinfold Thickness, Circumferences, and Bone Breadths: 71 healthy female subjects, body fat measurements and several anthropometric measurements are available for predictive modelling of body fat
#using decision tree, predict body fat based on other variables
library(TH.data)
library(rpart)
library(rpart.plot)
library(mboost)
str(bodyfat)
head(bodyfat)
data("bodyfat", package = "TH.data")
?bodyfat  #understand the data
dim(bodyfat)
attributes(bodyfat)

#Preparing training set and test set
set.seed(3456)
ind <- sample(2,nrow(bodyfat),replace=TRUE,prob=c(0.7,0.3))
trainingSet <- bodyfat[ind==1,]
testSet <- bodyfat[ind==2,]

#Train a decision tree
library(rpart)
formula <- DEXfat ~ age + waistcirc + hipcirc + elbowbreadth + kneebreadth
bodyfat_rpart <- rpart(formula,data=trainingSet,control=rpart.control(minsplit=10))
attributes(bodyfat_rpart)

print(bodyfat_rpart$cptable)

print(bodyfat_rpart)

#Next, plotting rpart tree
plot(bodyfat_rpart)
#Ass text on the plot to get more details
text(bodyfat_rpart,use.n=T)

#Tree pruning
opt <- which.min(bodyfat_rpart$cptable[,"xerror"])
cp <- bodyfat_rpart$cptable[opt,"CP"]
bodyfat_prune <- prune(bodyfat_rpart,cp=cp)
print(bodyfat_prune)
plot(bodyfat_prune)
text(bodyfat_prune)

#Validating model using test set data
bodyfat_predict <- predict(bodyfat_prune,newdata=testSet)
xlim <- range(bodyfat$DEXfat)
plot(bodyfat_predict ~ DEXfat, data=testSet,xlab="Observed",ylab="Predicted",ylim=xlim,xlim=xlim)
abline(a=0,b=1)

