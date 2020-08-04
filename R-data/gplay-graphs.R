# 

library("ggplot2")

data <- read_csv("acc_dataset_full.csv")
par(mfrow = c(1, 1))

p <- ggplot(data=data, aes(x=genre)) + geom_bar() + geom_text(stat='count', aes(label=..count..), vjust=-1) 
p <- p + scale_x_discrete(name ="Categories") + scale_y_continuous(name ="Number of Apps")
p <- p + theme(axis.text.x=element_text(angle=45,hjust=1))
p
