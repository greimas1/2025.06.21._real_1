library(dplyr)
library(randomForest)
library(caret)
rdata1 <- read.csv("P210304-01.csv")
rdata2 <- read.csv("P210304-02.csv")

str(rdata1)
str(rdata2)

rdata1$TravelInsurance <- as.factor(rdata1$TravelInsurance)

idx <- sample(1:nrow(rdata1), nrow(rdata1)*0.7)
train <- rdata1[idx,-1]
test <- rdata1[-idx,-1]

md1 <- randomForest(TravelInsurance~., data=train, ntree=300)
pred1 <- predict(md1, newdata=test, type="response")
cm <- confusionMatrix(pred1, test$TravelInsurance, mode = "everything")
print(cm$byClass["F1"])

md2 <- randomForest(TravelInsurance~., data=rdata1[,-1], ntree=300)
pred2 <- predict(md2, newdata=rdata2[,-1], type="prob")
str(pred2)
str(rdata2)

result <- data.frame(rdata2$X, pred2[,2])
colnames(result) <- c("ID", "y_pred")
write.csv(result, "수험번호_2025.05.22.csv", row.names=FALSE)
