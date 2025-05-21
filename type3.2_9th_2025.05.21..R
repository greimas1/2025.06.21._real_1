library(dplyr)

rdata <- read.csv("airquality.csv", fileEncoding="euc-kr")
str(rdata)
summary(rdata)
rdata <- rdata %>% na.omit()

md <- lm(Temp ~ Ozone + Solar.R + Wind, data = rdata)
summary(md)$coefficients[-1,4]
result1 <- sum(summary(md)$coefficients[-1,4]<0.05)
print(result1)
#1

md2 <- lm(Temp ~ Ozone + Wind, data = rdata)
cor_data <- cor(rdata$Temp, rdata$Ozone, method="pearson")
#rdata$Temp
#rdata$Ozone
result2 <- round(cor_data,3)
print(result2)
#0.699



idx <- sample(1:nrow(rdata), nrow(rdata)*0.7)
train <- rdata[idx,]
test <- rdata[-idx,]

md3 <- lm(Temp ~ Ozone + Wind, data = train)
pred <- predict(md3, newdata = test)
typeof(pred)
str(pred)

mse <- mean((pred-test$Temp)^2)
rmse <- sqrt(mse)
result3 <- round(rmse,3)
print(result3)
#7.007

