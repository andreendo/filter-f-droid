library("ggplot2")

data <- read_csv("analyzeData-normalized-by-loc.csv")
summary(data$`CM-IndexDIACodeElements`)
summary(data$`CM-IndexAllCodeElements`)

hist(data$`CM-IndexAllCodeElements`)

p <- ggplot(data, aes(x=data$`CM-IndexAllCodeElements`)) + geom_bar() + geom_text(stat='count', aes(label=..count..), vjust=-1) + xlim(-1, 27)
p + scale_x_continuous("Number of different types of code elements used", labels = as.character(c(0:26)), breaks = c(0:26)) + scale_y_continuous(name ="Number of Apps")

table(data$`CM-IndexAllCodeElements`)
summary(data$`CM-IndexAllCodeElements`)

data[data$`CM-IndexAllCodeElements` >= 26,]$app
data[data$`CM-IndexDIACodeElements` >= 21,]$app

summary(data$`CM-IndexDIACodeElements`)
p <- ggplot(data, aes(x=data$`CM-IndexDIACodeElements`)) + geom_bar() + geom_text(stat='count', aes(label=..count..), vjust=-1) + xlim(-1, 27)
p + scale_x_continuous("Number of different types of code elements used", labels = as.character(c(0:26)), breaks = c(0:26)) + scale_y_continuous(name ="Number of Apps")

data[data$`CM-IndexDIACodeElements` == 0,]$app
