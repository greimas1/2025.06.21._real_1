library(randomForest)
library(caret)
library(pROC)
library(dplyr)
#str(iris)
#head(iris)
#rdata <- iris[iris$Species != "virginica",]

rdata <- iris[iris$Species %in% c("setosa", "versicolor"),]

#str(rdata)
#rdata
rdata$Species <- as.factor(rdata$Species)
#rdata
#str(rdata)

rdata <- droplevels(rdata)

md <- randomForest(Species~., data = rdata, ntree = 300)
pred <- predict(md, newdata = rdata, type="prob")

typeof(pred)
str(pred)
pred[,2]

roc_ob <- roc(rdata$Species, pred[,2])
auc(roc_ob)
print(auc(roc_ob))
