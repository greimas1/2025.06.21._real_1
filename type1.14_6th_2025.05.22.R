library(dplyr)

rdata <- read.csv("P230602.csv")
str(rdata)
#     
rdata$student_num <- rdata$student_1 + rdata$student_2 + rdata$student_3 + rdata$student_4 + rdata$student_5 + rdata$student_6

rdata$teach_stu <- rdata$student_num/(rdata$teacher)

data <- rdata %>% arrange(desc(teach_stu))
result <- data$teacher[1]
print(as.integer(result))
#6

