library(readr)
library("ggplot2")
gplaydata <- read_csv("gplaydata.csv")
gplaydata$app <- tolower(gplaydata$app)
profmapp <- read_csv("./prof-mapp.csv")
colnames(profmapp)[1] <- "app"


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
hist(lint_partial01$`AL-ClickableViewAccessibility`)
summary(lint_partial01$`AL-TotalOfAccessibilityIssues`)
boxplot(lint_partial01$`AL-TotalOfAccessibilityIssues`)

data <- read.csv("~/git/filter-f-droid/R-data/data.csv")
View(data)


summary((data$XML_ATT + data$SRC_ATT)/data$LINES_SRC)

#acc-related att / LoC
plot((data$XML_ATT + data$SRC_ATT)/data$LINES_SRC)

# merging data frames
m1 <- merge(gplaydata, lint.partial01)
m1$APP <- tolower(m1$app)
m2 <- merge(m1, data)

plot((m2$XML_ATT + m2$SRC_ATT)/m2$LINES_SRC, m2$`AL-TotalOfAccessibilityIssues`/m2$LINES_SRC)

boxplot(m2$`AL-TotalOfAccessibilityIssues`/m2$LINES_SRC)

cor((m2$XML_ATT + m2$SRC_ATT)/m2$LINES_SRC, m2$`AL-TotalOfAccessibilityIssues`/m2$LINES_SRC, method = "spearman")

cor((m2$XML_ATT), m2$`AL-TotalOfAccessibilityIssues`, method = "spearman")

cor.test((m2$LINES_SRC), m2$`AL-TotalOfAccessibilityIssues`, method = "kendall")

plot((m2$LINES_SRC), m2$`AL-TotalOfAccessibilityIssues`, log = 'xy')

plot((m2$installs), m2$`AL-TotalOfAccessibilityIssues`, log = 'x')

cor.test(m2$installs, m2$`AL-TotalOfAccessibilityIssues`, method = "spearman")

cor.test(m2$score, m2$`AL-TotalOfAccessibilityIssues`, method = "kendall")

plot(m2$`AL-TotalOfIssues`, m2$`AL-TotalOfAccessibilityIssues`, log = 'xy')
cor.test(m2$`AL-TotalOfIssues`, m2$`AL-TotalOfAccessibilityIssues`, method = "kendall")


plot(m2$ARQ_LAYOUT, m2$`AL-TotalOfAccessibilityIssues`, log = 'xy')
cor.test(m2$ARQ_LAYOUT, m2$`AL-TotalOfAccessibilityIssues`, method = "spearman")

plot(m2$XML_android.contentDescription/m2$LINES_SRC, m2$`AL-TotalOfAccessibilityIssues`/m2$LINES_SRC, log = 'xy')
cor.test(m2$XML_android.contentDescription/m2$ARQ_LAYOUT, m2$`AL-TotalOfAccessibilityIssues`/m2$LINES_SRC, method = "spearman")

table((m2$XML_android.labelFor > 0 | m2$SRC_setLabelFor > 0))


barplot(table(m2$`AL-TotalOfAccessibilityIssues`), ylim = c(0, 35))

plot(m2$XML_android.labelFor > 0, m2$`AL-TotalOfAccessibilityIssues`/m2$LINES_SRC)

hasLabelFor <- m2[m2$XML_android.labelFor > 0 | m2$SRC_setLabelFor > 0,]
nrow(hasLabelFor)
hasNotLabelFor <- m2[m2$XML_android.labelFor == 0 & m2$SRC_setLabelFor == 0,]
nrow(hasNotLabelFor)

summary(hasLabelFor$`AL-TotalOfAccessibilityIssues`/hasLabelFor$LINES_SRC)
summary(hasNotLabelFor$`AL-TotalOfAccessibilityIssues`/hasNotLabelFor$LINES_SRC)

par(mfrow = c(1, 2))
boxplot(hasLabelFor$`AL-TotalOfAccessibilityIssues`/hasLabelFor$LINES_SRC, ylim = c(0, 0.005))
boxplot(m2$`AL-TotalOfAccessibilityIssues`/m2$LINES_SRC, ylim = c(0, 0.005))
boxplot(hasNotLabelFor$`AL-TotalOfAccessibilityIssues`/hasNotLabelFor$LINES_SRC, ylim = c(0, 0.005))

cor.test(as.numeric(m2$XML_android.labelFor > 0 | m2$SRC_setLabelFor > 0), m2$`AL-TotalOfAccessibilityIssues`, method = "kendall")

table(m2$`AL-TotalOfAccessibilityIssues` == 0)

barplot(table(m2$XML_android.labelFor > 0 | m2$SRC_setLabelFor > 0))


res <- cor(m2[,c(176:278)], m2[,c(8:13)], method = "spearman")
round(res, 2)
install.packages("corrplot")
library(corrplot)
res <- cor(m2[,c(176:217)], m2[,c(10,11,12,13,8)], method = "spearman")

res <- cor(m2[,c(10,11,12,13,8)], m2[,c(176:217)], method = "spearman")

res <- cor(m2[,c(10,11,12,13,8)], m2[,c(218:269)], method = "spearman")

res <- cor(m2[,c(10,11,12,13,8)], m2[,c(270:278)], method = "spearman")

par(mfrow = c(1, 1))
corrplot(res, is.corr = FALSE, method = "color")
?corrplot

barplot(table(gplaydata$genre))
library(ggplot2)
table(gplaydata$genre)

sd(gplaydata$score)
mad(gplaydata$score)

sd(gplaydata$installs)
mad(gplaydata$installs)

sd(m2$LINES_SRC)
mad(m2$LINES_SRC)
summary(m2$LINES_SRC)

summary(m2$ARQ_LAYOUT)
sd(m2$ARQ_LAYOUT)
mad(m2$ARQ_LAYOUT)

p <- ggplot(data=gplaydata, aes(x=genre)) + geom_bar() + geom_text(stat='count', aes(label=..count..), vjust=-1) 
p <- p + scale_x_discrete(name ="Categories") + scale_y_continuous(name ="Number of Apps")
p <- p + theme(axis.text.x=element_text(angle=45,hjust=1))
p  

sum(m2$`AL.TotalOfIssues` == 0)
barplot(table(m2$`AL.TotalOfAccessibilityIssues` > 0))
table(m2$`AL.TotalOfAccessibilityIssues` > 0)
table(m2$`AL.ClickableViewAccessibility` > 0)
table(m2$`AL.ContentDescription` > 0)
table(m2$AL.KeyboardInaccessibleWidget > 0)
table(m2$AL.LabelFor > 0)
barplot(table(m2$`AL.ClickableViewAccessibility` > 0))
barplot(table(m2$`AL.ContentDescription` > 0))
barplot(table(m2$AL.KeyboardInaccessibleWidget > 0))
barplot(table(m2$AL.LabelFor > 0))

barplot(table(m2$AL.GetContentDescriptionOverride > 0))

boxplot(10000*m2$AL.TotalOfAccessibilityIssues/m2$LINES_SRC)

accPerc <- 100*m2$AL.TotalOfAccessibilityIssues/m2$AL.TotalOfIssues
accPerc[is.nan(accPerc)] <- 0
summary(accPerc)

100* (115 - sum(accPerc > 0)) / 115
accPerc[accPerc > 0]


hist(accPerc, breaks = 50, xlim = c(0, 50))
hist(accPerc[accPerc > 0], breaks = 50, xlim = c(0, 50))

hist(m2$AL.TotalOfAccessibilityIssues[m2$AL.TotalOfAccessibilityIssues > 0], breaks = 50, xlim = c(0, 50))
summary(m2$AL.TotalOfAccessibilityIssues[m2$AL.TotalOfAccessibilityIssues > 0])

accPerc2 <- m2$AL.TotalOfAccessibilityIssues/m2$LINES_SRC

115 - 33

table(accPerc)

hist(accPerc2)
plot(accPerc, accPerc2, log = 'x')
cor.test(accPerc, accPerc2, method = "spearman")
cor.test(m2$score, accPerc)
summary(accPerc)

m2[accPerc > 40,]$APP
accPerc

plot(m2$LINES_SRC, m2$AL.TotalOfAccessibilityIssues, log = 'xy')
cor.test(m2$LINES_SRC, m2$AL.TotalOfAccessibilityIssues, method = "spearman")

sum(m2$AL.GetContentDescriptionOverride > 0)
sum(m2$AL.ContentDescription > 0)
sum(m2$AL.LabelFor > 0)
sum(m2$AL.ClickableViewAccessibility > 0)
sum(m2$AL.KeyboardInaccessibleWidget > 0)


summary(lint.partial01)


m2$acc_index <- as.integer((m2$SRC_setContentDescription + m2$XML_android.contentDescription) > 0)
m2$acc_index <- m2$acc_index + as.integer(m2$SRC_addCaptioningChangeListener > 0) 
m2$acc_index <- m2$acc_index + as.integer((m2$XML_android.nextFocusForward + m2$SRC_setNextFocusForwardId) > 0)
m2$acc_index <- m2$acc_index + as.integer((m2$XML_android.nextFocusUp + m2$SRC_setNextFocusUpId) > 0)
m2$acc_index <- m2$acc_index + as.integer((m2$XML_android.nextFocusDown + m2$SRC_setNextFocusDownId) > 0)
m2$acc_index <- m2$acc_index + as.integer((m2$XML_android.nextFocusLeft + m2$SRC_setNextFocusLeftId) > 0)
m2$acc_index <- m2$acc_index + as.integer((m2$XML_android.nextFocusRight + m2$SRC_setNextFocusRightId) > 0)
m2$acc_index <- m2$acc_index + as.integer((m2$XML_android.accessibilityPaneTitle + m2$SRC_setAccessibilityPaneTitle) > 0)
m2$acc_index <- m2$acc_index + as.integer((m2$XML_android.accessibilityTraversalBefore + m2$SRC_setAccessibilityTraversalBefore) > 0)
m2$acc_index <- m2$acc_index + as.integer((m2$XML_android.accessibilityTraversalAfter + m2$SRC_setAccessibilityTraversalAfter) > 0)
m2$acc_index <- m2$acc_index + as.integer((m2$XML_android.accessibilityHeading + m2$SRC_setAccessibilityHeading) > 0)
m2$acc_index <- m2$acc_index + as.integer((m2$XML_android.screenReaderFocusable + m2$SRC_setScreenReaderFocusable) > 0)
m2$acc_index <- m2$acc_index + as.integer((m2$XML_android.hint + m2$SRC_setHint) > 0)
m2$acc_index <- m2$acc_index + as.integer((m2$XML_android.labelFor + m2$SRC_setLabelFor) > 0)
m2$acc_index <- m2$acc_index + as.integer(m2$SRC_onInitializeAccessibilityNodeInfo > 0) 
m2$acc_index <- m2$acc_index + as.integer(m2$SRC_replaceAccessibilityAction > 0) 
m2$acc_index <- m2$acc_index + as.integer((m2$XML_android.accessibilityLiveRegion + m2$SRC_setAccessibilityLiveRegion) > 0)
m2$acc_index <- m2$acc_index + as.integer((m2$XML_android.importantForAccessibility + m2$SRC_setImportantForAccessibility) > 0)
m2$acc_index <- m2$acc_index + as.integer((m2$XML_android.hapticFeedbackEnabled + m2$SRC_setHapticFeedbackEnabled) > 0)
m2$acc_index <- m2$acc_index + as.integer(m2$SRC_sendAccessibilityEvent > 0) 
m2$acc_index <- m2$acc_index + as.integer(m2$SRC_sendAccessibilityEventUnchecked > 0) 
m2$acc_index <- m2$acc_index + as.integer(m2$SRC_dispatchPopulateAccessibilityEvent > 0) 
m2$acc_index <- m2$acc_index + as.integer(m2$SRC_onPopulateAccessibilityEvent > 0) 
m2$acc_index <- m2$acc_index + as.integer(m2$SRC_onInitializeAccessibilityNodeInfo.1 > 0) 
m2$acc_index <- m2$acc_index + as.integer(m2$SRC_onRequestSendAccessibilityEvent > 0) 

m2$acc_index
m2$perc_acc_issues <- 100 * m2$AL.TotalOfAccessibilityIssues / m2$AL.TotalOfIssues
m2$perc_acc_issues[is.nan(m2$perc_acc_issues)] <- 0
summary(m2$perc_acc_issues)
m2$acc_issues_loc <- m2$AL.TotalOfAccessibilityIssues / m2$LINES_SRC

par(mfrow = c(1, 3))
boxplot(m2$perc_acc_issues, ylim = c(0, 15))
boxplot(m2[m2$acc_index < 1,]$perc_acc_issues, ylim = c(0, 15))
boxplot(m2[m2$acc_index >= 1,]$perc_acc_issues, ylim = c(0, 15))

par(mfrow = c(1, 3))
boxplot(m2$perc_acc_issues, ylim = c(0, 15))
boxplot(m2[m2$acc_index < 2,]$perc_acc_issues, ylim = c(0, 15))
boxplot(m2[m2$acc_index >= 2,]$perc_acc_issues, ylim = c(0, 15))

par(mfrow = c(1, 3))
boxplot(m2$perc_acc_issues, ylim = c(0, 15))
boxplot(m2[m2$acc_index < 3,]$perc_acc_issues, ylim = c(0, 15))
boxplot(m2[m2$acc_index >= 3,]$perc_acc_issues, ylim = c(0, 15))

par(mfrow = c(1, 3))
boxplot(m2$perc_acc_issues, ylim = c(0, 15))
boxplot(m2[m2$acc_index < 4,]$perc_acc_issues, ylim = c(0, 15))
boxplot(m2[m2$acc_index >= 4,]$perc_acc_issues, ylim = c(0, 15))

par(mfrow = c(1, 3))
boxplot(m2$acc_issues_loc, ylim = c(0, 0.004))
boxplot(m2[m2$acc_index < 4,]$acc_issues_loc, ylim = c(0, 0.004))
boxplot(m2[m2$acc_index >= 4,]$acc_issues_loc, ylim = c(0, 0.004))


par(mfrow = c(1, 3))
boxplot(m2$perc_acc_issues, ylim = c(0, 15))
boxplot(m2[m2$acc_index < 5,]$perc_acc_issues, ylim = c(0, 15))
boxplot(m2[m2$acc_index >= 5,]$perc_acc_issues, ylim = c(0, 15))


par(mfrow = c(1, 3))
boxplot(m2$perc_acc_issues, ylim = c(0, 15))
boxplot(m2[m2$acc_index < 6,]$perc_acc_issues, ylim = c(0, 15))
boxplot(m2[m2$acc_index >= 6,]$perc_acc_issues, ylim = c(0, 15))

par(mfrow = c(1, 3))
boxplot(m2$acc_index)
boxplot(m2[m2$AL.TotalOfAccessibilityIssues == 0,]$acc_index)
boxplot(m2[m2$AL.TotalOfAccessibilityIssues > 0,]$acc_index)


m2[m2$acc_index >= 5,]$perc_acc_issues

m2[m2$AL.TotalOfAccessibilityIssues == 0,]$acc_index

par(mfrow = c(1, 2))
plot(m2$acc_index, m2$perc_acc_issues)
plot(m2$acc_index, m2$acc_issues_loc)



cor.test(m2$acc_index, m2$perc_acc_issues, method = "spearman")
cor.test(m2$acc_index, m2$acc_issues_loc, method = "spearman")


#Mate data
mate$app <- tolower(mate$projectname)
summary(mate)

m2$app <- tolower(m2$app)
m3 <- merge(m2, mate)

par(mfrow = c(1, 1))
plot(mate$activities_executed, mate$violations)

cor.test(mate$activities_executed, mate$violations, method = "spearman")
boxplot(mate$violations)
  
plot(m3$AL.TotalOfAccessibilityIssues, m3$violations, log = 'y')
cor.test(m3$AL.TotalOfAccessibilityIssues, m3$violations, method = "spearman")

plot(m3$acc_index, m3$violations / m3$activities_executed)
cor.test(m3$acc_index, m3$violations / m3$activities_executed, method = "spearman")


# Some relation here
plot(m3$acc_index, m3$violations / m3$LINES_SRC)
cor.test(m3$acc_index, m3$violations / m3$LINES_SRC, method = "spearman")

m3$mate_issues_per_loc <- m3$violations / m3$LINES_SRC

m3$mate_issues_per_widgets <- m3$violations / m3$widgets
m3$mate_issues_per_widgets <- m3$widgets_with_issues / m3$widgets
cor.test(m3$acc_index, m3$mate_issues_per_widgets, method = "spearman")


par(mfrow = c(1, 3))
boxplot(m3$mate_issues_per_loc, ylim = c(0, 0.1))
boxplot(m3[m3$acc_index < 1,]$mate_issues_per_loc, ylim = c(0, 0.1))
boxplot(m3[m3$acc_index >= 1,]$mate_issues_per_loc, ylim = c(0, 0.1))

sum(m3$acc_index < 2)
sum(m3$acc_index >= 2)

# Some relation here
par(mfrow = c(1, 3))
boxplot(m3$mate_issues_per_loc, ylim = c(0, 0.1))
boxplot(m3[m3$acc_index < 2,]$mate_issues_per_loc, ylim = c(0, 0.1))
boxplot(m3[m3$acc_index >= 2,]$mate_issues_per_loc, ylim = c(0, 0.1))

par(mfrow = c(1, 3))
boxplot(m3$mate_issues_per_loc, ylim = c(0, 0.1))
boxplot(m3[m3$acc_index < 3,]$mate_issues_per_loc, ylim = c(0, 0.1))
boxplot(m3[m3$acc_index >= 3,]$mate_issues_per_loc, ylim = c(0, 0.1))

par(mfrow = c(1, 1))
plot(m3$acc_index, m3$score)
cor.test(m3$acc_index, m3$score, method = "spearman")
plot(m3$acc_index, m3$installs, log = 'y')
cor.test(m3$acc_index, m3$installs, method = "spearman")

colnames(mate)

plot(m3$acc_issues_loc, m3$mate_issues_per_loc, log = 'xy')
cor.test(m3$acc_issues_loc, m3$mate_issues_per_loc, method = "spearman")


