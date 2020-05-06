library(plyr)
library(mongolite)


db <- mongo(collection = "data", db = "covid19", url = "mongodb://localhost:27017")
data <- db$find()
df <- data.frame(data)
df <- transform(df, dateRep = as.Date(dateRep, format="%d/%m/%Y"))


# 1
dateSort <- df[order(df$dateRep),]
dateSums <- ddply(dateSort,.(dateRep),summarize, cases=sum(as.numeric(cases)),deaths=sum(as.numeric(deaths)))
plot(dateSums$dateRep, dateSums$deaths)

dateSort

# 2
changeData <- mutate(dateSort, change = )
