library(dplyr)
rdata <- read.csv("P230605.csv", fileEncoding="euc-kr")
str(rdata)
total <- nrow(rdata)
data <- rdata %>% group_by(코드) %>% summarise(건수=n(), 비율=건수/total)
str(data)
result1 <- data$비율[4]
print(round(result1,3))
#0.787


chi <- chisq.test(data$건수, p=c(0.05, 0.1, 0.05, 0.8))
typeof(chi)
result2 <- chi$statistic
print(round(result2,3))
#0.997

result3 <- chi$p.value
print(round(result3,3))
#0.802

