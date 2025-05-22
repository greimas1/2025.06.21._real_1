library(dplyr)
library(lubridate)
rdata <- read.csv("P230601.csv")

str(rdata)

rdata$신고일시 <- ymd_hm(rdata$신고일시)
rdata$출동일시 <- ymd_hm(rdata$출동일시)
rdata$출동시간 <- difftime(rdata$출동일시, rdata$신고일시, unit="secs")

rdata <- rdata %>% mutate(연도=year(rdata$신고일시), 월=month(rdata$신고일시))

str(rdata)

data <- rdata %>% group_by(출동소방서, 연도, 월) %>%
  summarise(평균출동시간=mean(출동시간))%>%arrange(desc(평균출동시간))

str(data)
head(data,10)

result <- data$평균출동시간[1]/60

print(as.integer(result))

#64

#data <- rdata %>% arrange(desc(출동시간))
#print(data$출동소방서[1])

#result <- data$출동시간[1]/60
#print(result)
#1441분