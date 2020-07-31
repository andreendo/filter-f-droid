library(readr)

# read prof-mapp.csv
profmapp <- read_csv("./prof-mapp.csv")
colnames(profmapp)[1] <- "app"

gplaydata <- read_csv("./gplaydata.csv")
gplaydata$app <- tolower(gplaydata$app)



lint <- read_csv("./lint.csv")
lint$app <- tolower(lint$app)

mate <- read_csv("./mate.csv")
colnames(mate)[1] <- "app"
mate$app <- tolower(mate$app)

acc_dataset <- merge(profmapp, gplaydata)
acc_dataset <- merge(acc_dataset, lint)
acc_dataset <- merge(acc_dataset, mate)

write_csv(acc_dataset, "./acc_dataset.csv")
