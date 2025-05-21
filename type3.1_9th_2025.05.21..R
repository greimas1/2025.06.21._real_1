library(dplyr)

rdata <- read.csv("customer.csv")

str(rdata)
rdata$status <- as.factor(rdata$status)

idx <- sample(1:nrow(rdata), nrow(rdata)*0.7)
train <- rdata[idx,]
test <- rdata[-idx,]

md <- glm(status ~ calls + rating + purchases, family = "binomial", data = train)
summary(md)$coefficients[,4]
pval <- summary(md)$coefficients[,4]
print(round(max(pval),3))
#0.951


result2 <- round(exp(summary(md)$coefficients["rating","Estimate"]),3)
print(result2)
#1.001


pred <- predict(md, newdata = test)
typeof(pred)
str(pred)

pred_stat <- ifelse(pred>0.5,1,0)
acc <- mean(pred_stat == test$status)
err <- 1-acc
print(round(err,3))
#0.511

pred_stat <- ifelse(pred>0.5,1,0)
acc <- mean(as.factor(pred_stat) == test$status)
err <- 1-acc
print(round(err,3))


