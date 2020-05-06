#1
weigh_loss[5] - weigh_loss[16]

#2
(weigh_loss[4] / weigh_loss[5]) * 100

#3a
diff <- weigh_loss[5] - weigh_loss[16]
weigh_loss[which.max(apply(diff, MARGIN=1, FUN=max)),]

#3b
diff = (weigh_loss[16]/weigh_loss[5])*100
weigh_loss[which.min(apply(diff, MARGIN=1, FUN=min)),]

#4
mars_success = weigh_loss[6] >= weigh_loss[7]
september_success = weigh_loss[12] >= weigh_loss[13]
hverjir <- mars_success==TRUE & september_success==FALSE
Winners <- data.frame(name=weigh_loss[1], Winner=hverjir)

Winners

#5
install.packages("dplyr")
library(dplyr)


Success <- round(
  ((weigh_loss[4]/weigh_loss[5])*100)[[1]],
  digits=1
)

weigh_loss_moar <- mutate(weigh_loss,success_rate=Success)

weigh_loss_moar
