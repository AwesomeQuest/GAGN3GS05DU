library(plyr)
library(mongolite)


db <- mongo(collection = "data", db = "covid19", url = "mongodb://localhost:27017")

data <- db$find()

df <- data.frame(data)


ddply(df,.(year, geoId),summarize,cases=sum(as.numeric(cases)),deaths=sum(as.numeric(deaths)))

