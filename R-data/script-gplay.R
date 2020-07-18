library(readr)
library("ggplot2")
gplaydata <- read_csv("gplaydata.csv")
View(gplaydata)
summary(gplaydata)
summary(gplaydata$score)
boxplot(gplaydata$score)

barplot(table(gplaydata$genre))

barplot(table(gplaydata$androidVersion))

summary(gplaydata$installs)
hist(gplaydata$installs)
?hist


#lint data
library(readr)
lint_partial01 <- read_csv("lint-partial01.csv")
View(lint_partial01)

summary(lint_partial01)

hist(lint_partial01$`AL-TotalOfIssues`)
boxplot(lint_partial01$`AL-TotalOfIssues`)
hist(lint_partial01$`AL-TotalOfAccessibilityIssues`)
summary(lint_partial01$`AL-TotalOfAccessibilityIssues`)
boxplot(lint_partial01$`AL-TotalOfAccessibilityIssues`)
