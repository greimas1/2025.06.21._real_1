library(dplyr)

rdata <- read.csv("P230603.csv")

str(rdata)
#년월      

rdata$범죄수 <- rdata$강력범 + rdata$절도범 + rdata$폭력범 + rdata$지능범 + rdata$풍속범 + rdata$기타형사범

rdata <- rdata %>% mutate(연도=substr(rdata$년월,1,4), 월=substr(rdata$년월,6,7))

data <- rdata %>% group_by(연도) %>% summarise(월평균범죄수=mean(범죄수)) %>% arrange(desc(월평균범죄수))

str(data)
result <- data$월평균범죄수[1]

head(data,10)
print(result)
#19329.25
