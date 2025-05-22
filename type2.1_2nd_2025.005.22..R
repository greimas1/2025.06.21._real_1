library(dplyr)
library(randomForest)
library(pROC)
rdata1 <- read.csv("P210204-01.csv")
rdata2 <- read.csv("P210204-02.csv")


str(rdata1)
str(rdata2)

rdata1$Reached.on.Time_Y.N <- as.factor(rdata1$Reached.on.Time_Y.N)

idx <- sample(1:nrow(rdata1),nrow(rdata1)*0.7)
train <- rdata1[idx,-1]
test <- rdata1[-idx,-1]

md1 <- randomForest(Reached.on.Time_Y.N~., data=train, ntree = 300)
pred1 <- predict(md1, newdata=test, type="prob")
#str(pred1)
roc_obj <- roc(test$Reached.on.Time_Y.N, pred1[,2])
auc(roc_obj)
print(auc(roc_obj))


md2 <- randomForest(Reached.on.Time_Y.N~., data=rdata1[,-1], ntree = 300)
pred2 <- predict(md2, newdata=rdata2[,-1], type="prob")
str(pred2)
result <- data.frame(rdata2$ID, pred2[,2])
colnames(result) <- c("ID", "pred")
write.csv(result, "수험번호20250522.csv", row.names=FALSE)
