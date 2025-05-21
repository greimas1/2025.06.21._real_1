library(dplyr)

rdata <- read.csv("P230606.csv")

str(rdata)

md <- lm(Temperature~O3 + Solar + Wind, data=rdata)
result1 <- summary(md)$coefficients["O3","Estimate"]
print(round(result1,3))
#0.172


t.test(rdata$Wind, rdata$Temperature)$p.value
result2 <- t.test(rdata$Wind, rdata$Temperature)$p.value
print(round(result2,3))
#0


#c=(10,90,20)
O3 = 10
Solar = 90
Wind = 20
new <- data.frame(O3, Solar, Wind)

#newdata <- data.frame(10,90,20)
#colnames(newdata) <- c("O3", "Solar", "Wind")
#print(newdata)


pred <- predict(md, newdata = new)
result3 <- round(pred,3)
print(result3)
#68.334

