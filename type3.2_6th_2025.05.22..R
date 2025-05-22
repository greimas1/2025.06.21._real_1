library(dplyr)

rdata <- read.csv("P230606.csv")

str(rdata)

md <- lm(Temperature ~ O3 + Solar + Wind, data = rdata)
summary(md)

result1 <- summary(md)$coefficients["O3","Estimate"]
print(round(result1,3))
#0.172


t.test(rdata$Wind, rdata$Temperature)$p.value
result2 <-t.test(rdata$Wind, rdata$Temperature)$p.value
print(round(result2,3))
#0



new <- data.frame(10, 90, 20)
colnames(new) <- c("O3", "Solar", "Wind")

pred <- predict(md, newdata=new)
result3 <- round(pred,3)
print(result3)
#68.334

