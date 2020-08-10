library("ggplot2")

data <- read_csv("analyzeData-normalized-by-loc.csv")
nn_data <- read_csv("analyzeData-non-normalized.csv")
full <- read.csv("acc_dataset_full.csv")

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

library(corrplot)
res <- cor(data[,c(57:68)], data[,c(70:89)], method = "spearman")

cor.test(data$`GP-installs`, data$`M-Orientation`, method = "spearman")

plot(data$`GP-installs`, data$`M-Orientation`, log = 'xy')

boxplot(data$`M-Orientation`)

par(mfrow = c(1, 1))
corrplot(res, is.corr = FALSE, method = "number")
res


res <- cor(data[,c(70:89)], data[,c(2:56)], method = "spearman")
corrplot(res, is.corr = FALSE, method = "color")
res

plot(data$background, data$total_of_issues, log = 'xy')
plot(data$textColor, data$total_of_issues, log = 'xy')

plot(nn_data$background, nn_data$total_of_issues, log = 'xy')

sum(nn_data$background > 0)/111
sum(nn_data$textColor > 0)/111

summary(nn_data$background)
summary(nn_data$textColor)

hist(nn_data$isEnabled)
summary(nn_data$isEnabled)
summary(nn_data$getLocale)
sum(nn_data$isEnabled > 0)/111
sum(nn_data$getLocale > 0)/111
hist(nn_data$getLocale)

plot(full$LINES_SRC, nn_data$`CM-SumAllCodeElements`, log = "xy")
cor.test(full$LINES_SRC, nn_data$`CM-SumAllCodeElements`, method = "spearman")

sum(nn_data$total_of_issues)
summary(nn_data$total_of_issues)

sum(nn_data$`AL-acc_issues`==0)
summary(nn_data$`AL-acc_issues`)
summary(nn_data$total_of_issues)

8*sum(nn_data$`AL-acc_issues`) 
#/ 
sum(nn_data$`M-acc_issues`)

summary(data$total_of_issues)

plot(nn_data$`AL-acc_issues`) 
sum(nn_data$`M-acc_issues`)
nn_data[nn_data$`AL-acc_issues` > 50,]$app

cor.test(nn_data$`AL-acc_issues`, nn_data$`M-acc_issues`, method = "spearman")

plot(nn_data$`AL-acc_issues`, nn_data$`M-acc_issues`, log = 'xy')

sum(nn_data$`AL-acc_issues`)
sum(nn_data$`AL-GetContentDescriptionOverride`>0)
sum(nn_data$`AL-GetContentDescriptionOverride`)
sum(nn_data$`AL-ClickableViewAccessibility`>0)
sum(nn_data$`AL-ClickableViewAccessibility`)
sum(nn_data$`AL-ContentDescription`>0)
sum(nn_data$`AL-ContentDescription`)
sum(nn_data$`AL-KeyboardInaccessibleWidget`>0)
sum(nn_data$`AL-KeyboardInaccessibleWidget`)
sum(nn_data$`AL-LabelFor`>0)
sum(nn_data$`AL-LabelFor`)

sum(nn_data$`M-acc_issues`)
# mate - perceivable
sum(nn_data$`M-NonTextContent` + nn_data$`M-IdentifyInputPurpose` + nn_data$`M-ContrastMinimum` + nn_data$`M-DuplicateContentDescription` + nn_data$`M-Orientation`)
sum(nn_data$`M-NonTextContent` > 0)
sum(nn_data$`M-IdentifyInputPurpose` > 0)
sum(nn_data$`M-ContrastMinimum` > 0)
sum(nn_data$`M-DuplicateContentDescription` > 0)
sum(nn_data$`M-Orientation` > 0)

# mate - operable
sum(nn_data$`M-TargetSize` + nn_data$`M-Spacing` + nn_data$`M-PageTitled`)
100* sum(nn_data$`M-TargetSize` + nn_data$`M-Spacing` + nn_data$`M-PageTitled`) / sum(nn_data$`M-acc_issues`)
sum(nn_data$`M-TargetSize` > 0)
sum(nn_data$`M-Spacing` > 0)
sum(nn_data$`M-PageTitled` > 0)


# mate - understandable
sum(nn_data$`M-LabelOrInstructions`)
100*sum(nn_data$`M-LabelOrInstructions`) / sum(nn_data$`M-acc_issues`)
sum(nn_data$`M-LabelOrInstructions` > 0)

