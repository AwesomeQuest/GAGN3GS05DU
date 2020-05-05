x <- read.csv("nemendur.csv")
df <- data.frame(x)

avgGrade <- data.frame(name=df[,1], average=rowMeans(df[,-1]), maxEink=df[which.max(df[,-1]),], minEink=df[which.min(df[,-1]),] )
avgGrade


df[which.min(df[,1]),]
