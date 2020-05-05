
library(jsonlite)
library(mongolite)

db <- mongo(collection = "Nem", db = "Nemendur", url = "mongodb://localhost:27017")

data <- db$find()

x <- db$find()
df <- data.frame(x)

avgGrade <- data.frame(name=df[,1], average=rowMeans(df[,-1]), maxEink=apply(df[, 2:18], 1, max), minEink=apply(df[, 2:18], 1, min))
avgGrade


df[which.min(df[,1]),]
