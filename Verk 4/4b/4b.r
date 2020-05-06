library(plyr)
library(mongolite)
library(data.table)


db <- mongo(collection = "data", db = "covid19", url = "mongodb://localhost:27017")
data <- db$find()
df <- data.frame(data)
df <- transform(df, dateRep = as.Date(dateRep, format="%d/%m/%Y"))


# 1
dateSort <- df[order(df$dateRep),]
dateSums <- ddply(dateSort,.(dateRep),summarize, cases=sum(as.numeric(cases)),deaths=sum(as.numeric(deaths)))
plot(dateSums$dateRep, dateSums$deaths)

# 2
changeData <- dateSort
shiftdata <- rbind(c(1), changeData$cases)
changeData <- transform(changeData, 
                        changeCases = as.double(cases) / as.double(shiftdata))
#3
shiftdata <- rbind(c(1), changeData$deaths)
changeData <- transform(changeData, 
                        changeDeaths = as.double(deaths) / as.double(shiftdata))

changeData
